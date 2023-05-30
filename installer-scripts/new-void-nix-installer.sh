#!/bin/bash

sudo echo "Installing dependencies..."

sleep 1

sudo xbps-install -Sy wget curl tar xz busybox-static

echo "Preparing installer..."

sleep 5

sh <(curl -L https://nixos.org/nix/install) --daemon

"Creating runinit services..."

sudo mkdir -p /etc/sv/nix-daemon

sudo tee /etc/sv/nix-daemon <<EOF
#!/bin/sh
exec 2>&1
exec /nix/nix/nix/bin/nix-daemon
EOF

sudo ln -s /etc/sv/nix-daemon /var/service/

sudo tee /etc/profile.d/nix-daemon.sh <<EOF
export NIX_REMOTE=daemon
EOF

echo "adding sudo paths..."

sleep 5

bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-scripts/nix-sudo-path.sh)

sudo rm -f /etc/profile.d/nix.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/void-linux/void-packages/master/srcpkgs/nix/files/nix.sh


sudo echo "Configuring nix..."
sleep 1

sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix.conf
sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh

sudo tee /etc/profile.d/nix.sh <<EOF
if [ -e '/nix/nix/nix/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/nix/nix/etc/profile.d/nix-daemon.sh'
fi
EOF
sleep 1

sudo tee /etc/sudoers.d/nix-ssl-cert-file <<EOF
Defaults  env_keep += "NIX_SSL_CERT_FILE"
EOF
sleep 1

sudo ln -s /nix/nix/cacert/etc/ssl/certs/ca-bundle.crt /etc/ssl/certs/ca-bundle.crt
sleep 1

curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/build-scripts/nix-build.sh | sudo bash
sleep 1

curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/build-scripts/nix-link.sh | bash -s /usr
sleep 1

curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/build-scripts/nix-utils-install.sh | sudo bash
sleep 1



sudo echo "Cleaning up..."

sleep 1

sudo nix profile remove 0
sudo nix profile remove 0

echo "Linking..."

sleep 1

sudo ln -s /nix/var/nix/profiles/default /nix/nix-profile
sudo ln -s /nix/var/nix/profiles/default /var/nix-profile

"Creating a backup..."

sleep 1

bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/backup-scripts/create-backup.sh)

echo "Nix has finnished installing. Reboot your system for nix to work properly"
