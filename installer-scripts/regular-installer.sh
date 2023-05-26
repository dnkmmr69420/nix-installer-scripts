#!/bin/bash

if ! command -v wget &> /dev/null
then
    echo "wget is required for this script to work"
    exit 2
fi

sudo echo "Preparing nix installation script"
sleep 5
sh <(curl -L https://nixos.org/nix/install) --daemon --yes


sleep 1

echo "Modifying configurations"

sleep 1

sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix.conf
sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh
curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-scripts/nix-sudo-path.sh | bash

echo "Building nix..."

sleep 1

curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/setup.sh | bash -s /usr

if [ ! -f "/etc/ssl/certs/ca-bundle.crt" ] 
then
    sudo ln -s /nix/nix/cacert/etc/ssl/certs/ca-bundle.crt /etc/ssl/certs/ca-bundle.crt
fi

sudo echo "Cleaning up..."

sleep 1

sudo nix profile remove 0
sudo nix profile remove 0

sleep 1


echo "Creating a backup of nix"
sleep 1
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/backup-scripts/create-backup.sh)

echo "Finished installation"
