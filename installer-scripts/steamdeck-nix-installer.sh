#!/bin/bash

sudo echo "Creating services..."

sleep 3

sudo tee /etc/systemd/system/nix-directory.service <<EOF
[Unit]
Description=Create a `/nix` directory to be used for bind mounting
PropagatesStopTo=nix-daemon.service
PropagatesStopTo=nix.mount
DefaultDependencies=no

[Service]
Type=oneshot
ExecStart=steamos-readonly disable
ExecStart=mkdir -vp /nix
ExecStart=chmod -v 0755 /nix
ExecStart=chown -v root /nix
ExecStart=chgrp -v root /nix
ExecStart=steamos-readonly enable
ExecStop=steamos-readonly disable
ExecStop=rmdir /nix
ExecStop=steamos-readonly enable
RemainAfterExit=true
EOF

sleep 1

sudo tee /etc/systemd/system/nix.mount <<EOF
[Unit]
Description=Mount `/home/nix` on `/nix`
PropagatesStopTo=nix-daemon.service
PropagatesStopTo=nix-directory.service
After=nix-directory.service
Requires=nix-directory.service
ConditionPathIsDirectory=/nix
DefaultDependencies=no
RequiredBy=nix-daemon.service
RequiredBy=nix-daemon.socket

[Mount]
What=/home/nix
Where=/nix
Type=none
DirectoryMode=0755
Options=bind
EOF

sleep 1

sudo tee /etc/systemd/system/ensure-symlinked-units-resolve.service <<EOF
[Unit]
Description=Ensure Nix related units which are symlinked resolve
After=nix.mount
Requires=nix-directory.service
Requires=nix.mount
DefaultDependencies=no

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/systemctl daemon-reload
ExecStart=/usr/bin/systemctl restart --no-block nix-daemon.socket

[Install]
WantedBy=sysinit.target
EOF

echo "Enabling services..."

sleep 3

sudo systemctl enable --now ensure-symlinked-units-resolve.service

echo "Preparing nix installer..."

sleep 5

sh <(curl -L https://nixos.org/nix/install) --daemon --yes

echo "Creating a backup of nix"

sleep 3

echo "Installing nix backup"

sudo mkdir /home/nb
sudo cp -R /nix /home/nb

sudo tee /home/nb/reset-nix <<EOF
#!/bin/bash
sudo echo "Resetting nix..."
sudo rm -rf /nix/*
sudo mkdir -p /nix
sudo cp -R /home/nb/nix/* /nix/
sudo echo "Nix has been resetted. Reboot for changes to apply."
EOF

sudo chmod a+x /home/nb/reset-nix

sudo echo "Finished installing nix backup"

sleep 1

bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-scripts/nix-sudo-path.sh)

echo "Modifying configurations"

sleep 1

sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix.conf
sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh

echo "Finished installation"
