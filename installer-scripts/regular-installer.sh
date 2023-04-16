#!/bin/bash
sudo echo "Preparing nix installation script"
sleep 5
sh <(curl -L https://nixos.org/nix/install) --daemon
echo "Creating a backup of nix"
sleep 1
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installers/main/nix-backup.sh)

sleep 1

bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-scripts/nix-linker.sh)
