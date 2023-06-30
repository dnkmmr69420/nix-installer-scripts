#!/usr/bin/env bash

sudo mkdir /var/lib/nix

echo "Setting SELinux context for /nix and /var/lib/nix"

for path in "" "/var/lib"; do
  sudo semanage fcontext -a -t etc_t $path'/nix/store/[^/]+/etc(/.*)?'
  sudo semanage fcontext -a -t lib_t $path'/nix/store/[^/]+/lib(/.*)?'
  sudo semanage fcontext -a -t systemd_unit_file_t $path'/nix/store/[^/]+/lib/systemd/system(/.*)?'
  sudo semanage fcontext -a -t man_t $path'/nix/store/[^/]+/man(/.*)?'
  sudo semanage fcontext -a -t bin_t $path'/nix/store/[^/]+/s?bin(/.*)?'
  sudo semanage fcontext -a -t usr_t $path'/nix/store/[^/]+/share(/.*)?'
  sudo semanage fcontext -a -t var_run_t $path'/nix/var/nix/daemon-socket(/.*)?'
  sudo semanage fcontext -a -t usr_t $path'/nix/var/nix/profiles(/per-user/[^/]+)?/[^/]+'
done

echo "creating SSL cert file"

sudo tee /etc/systemd/system/nix-daemon.service.d/override.conf <<EOF
[Service]
Environment="NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt"
EOF

echo "Creating /nix mkdir service"

sudo tee /etc/systemd/system/mkdir-rootfs@.service <<EOF
[Unit]
Description=Enable mount points in / for ostree
ConditionPathExists=!%f
DefaultDependencies=no
Requires=local-fs-pre.target
After=local-fs-pre.target
[Service]
Type=oneshot
ExecStartPre=chattr -i /
ExecStart=mkdir -p '%f'
ExecStopPost=chattr +i /
EOF

echo "Creating nix.mount service"

sudo tee /etc/systemd/system/nix.mount <<EOF
[Unit]
Description=Nix Package Manager
DefaultDependencies=no
After=mkdir-rootfs@nix.service
Wants=mkdir-rootfs@nix.service
Before=sockets.target
After=ostree-remount.service
BindsTo=var.mount
[Mount]
What=/var/lib/nix
Where=/nix
Options=bind
Type=none
EOF

echo "Enabling mounting of /var/lib/nix to /nix and resetting SELinux context"

sudo systemctl daemon-reload
sudo systemctl enable nix.mount
sudo systemctl start nix.mount
sudo restorecon -RF /nix

echo "Temporarily setting SELinux to permissive"

sudo setenforce Permissive

echo "Running the Nix install script"

sleep 5

sh <(curl -L https://nixos.org/nix/install) --daemon --yes

echo "Nix installer has finished running"

echo "Copying service files"

sudo cp -f /nix/var/nix/profiles/default/lib/systemd/system/nix-daemon.{service,socket} /etc/systemd/system/
sudo restorecon -RF /nix
sudo systemctl daemon-reload
sudo systemctl enable --now nix-daemon.socket

echo "Setting SELinux back to enforcing"

sudo setenforce Enforcing

bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-scripts/nix-sudo-path.sh)

echo "Modifying configurations"

sudo wget -O /etc/nix/nix.conf https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix.conf
sudo wget -O /etc/profile.d/nix-app-icons.sh https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh

echo "Building Nix package manager"

curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/setup.sh | bash -s /usr/local

echo "Cleaning up"
sudo nix profile remove 0

echo "Linking"
sudo ln -s /nix/var/nix/profiles/default /nix/nix-profile
sudo ln -s /nix/var/nix/profiles/default /var/nix-profile

echo "Making a Nix backup"
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/backup-scripts/create-backup-selinux.sh)

echo "Reboot your system by typing"
echo "systemctl reboot"
