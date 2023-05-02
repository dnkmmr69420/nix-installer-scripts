#!/bin/bash
echo "Setting up distrobox with no nix mount..."
rm -rf ~/nix-distrobox
mkdir ~/nix-distrobox
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/nix-distrobox
rm -f ~/nix-distrobox/bin/distrobox-create
wget -P ~/nix-distrobox/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/distrobox-create
echo "Finished the setup"
