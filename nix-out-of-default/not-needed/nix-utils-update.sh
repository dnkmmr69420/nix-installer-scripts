#!/bin/bash

if (( $EUID != 0 )); then
    echo "Must be ran as root"
    exit 1
fi


wget -P /nix/nix/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/bin/reset-nix
wget -P /nix/nix/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/bin/update-nix
wget -P /nix/nix/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/bin/update-nix-fallback
wget -P /nix/nix/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/bin/nix-utils

chmod a+x /nix/nix/bin/reset-nix
chmod a+x /nix/nix/bin/update-nix
chmod a+x /nix/nix/bin/update-nix-fallback
chmod a+x /nix/nix/bin/nix-utils
