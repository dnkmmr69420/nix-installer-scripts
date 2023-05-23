#!/usr/bin/sudo bash

curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/build-scripts/nix-build.sh | sudo bash

curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/build-scripts/nix-utils-install.sh | sudo bash

curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/build-scripts/nix-link.sh | sudo bash -s $1
