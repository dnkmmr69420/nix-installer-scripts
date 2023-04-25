#!/usr/bin/env bash
# This is meant to be ran inside the distrobox container

echo "Installing nix..."
sh <(curl -L https://nixos.org/nix/install) --no-daemon
sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/nix.conf
sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh
echo "Finished installing nix"
