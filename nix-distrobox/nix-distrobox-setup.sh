#!/usr/bin/env bash
echo "What would you like to name the distrobox?"
read distrobox_name
echo "Creating $distrobox_name"
distrobox create -i archlinux:latest -n $distrobox_name
echo "Installing nix in distrobox"
distrobox enter $distrobox_name -- sh <(curl -L https://nixos.org/nix/install) --no-daemon
distrobox enter $distrobox_name -- sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/nix.conf
distrobox enter $distrobox_name -- sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh
