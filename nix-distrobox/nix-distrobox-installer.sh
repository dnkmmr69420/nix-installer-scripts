#!/bin/bash

# This should only be ran in a distrobox container

echo "Preparing nix installation script..."

sleep 5

sh <(curl -L https://nixos.org/nix/install) --no-daemon

echo "Modifying configs..."
sleep 1
sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/nix.conf
sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh

echo "exporting nix binaries"
sleep 1

mkdir -p ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix --export-path  ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix-build --export-path ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix-channel --export-path ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix-collect-garbage --export-path ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix-copy-closure --export-path ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix-env --export-path ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix-hash --export-path ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix-instantiate --export-path ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix-prefetch-url --export-path ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix-shell --export-path ~/.local/bin
distrobox-export --bin ~/.nix-profile/bin/nix-store --export-path ~/.local/bin
