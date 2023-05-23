#!/bin/bash

sudo rm -rf /nix/nix/bin
sudo mkdir -p /nix/nix/bin

sudo wget -P /nix/nix/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/bin/reset-nix
sudo wget -P /nix/nix/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/bin/update-nix
sudo wget -P /nix/nix/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/bin/update-nix-fallback

sudo chmod a+x /nix/nix/bin/reset-nix
sudo chmod a+x /nix/nix/bin/update-nix
sudo chmod a+x /nix/nix/bin/update-nix-fallback
