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
exec nix-daemon
EOF

sudo ln -s /etc/sv/nix-daemon /var/service/

"Setting up configs..."

bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/backup-scripts/create-backup.sh)

sleep 5

bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-scripts/nix-sudo-path.sh)

echo "Modifying configurations"

sleep 1

sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix.conf
sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh

sleep 1
