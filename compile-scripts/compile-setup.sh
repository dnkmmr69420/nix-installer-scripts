#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

mkdir -p /opt/nix-git
cd /opt/nix-git
git clone https://github.com/NixOS/nix.git
cd /opt/nix-git/nix
nix develop
nix develop .#native-clang11StdenvPackages
