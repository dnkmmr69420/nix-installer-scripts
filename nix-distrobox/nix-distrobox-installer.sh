#!/bin/bash

# This should only be ran in a distrobox container

echo "Installing xz."
echo "If you get an error message about the command not existing and you are not running an alpine linux container, just ignore the error."

sleep 1

sudo apk add xz

echo "Preparing nix installation script..."

sleep 5

sh <(curl -L https://nixos.org/nix/install) --no-daemon

echo "Modifying configs..."
sleep 1
sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/nix.conf
sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh

echo "exporting nix binaries"
sleep 1


