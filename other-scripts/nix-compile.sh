#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

PREFIX_DIR=$1

mkdir -p /opt/nix-git
cd /opt/nix-git
git clone https://github.com/NixOS/nix.git
cd /opt/nix-git/nix
nix develop
nix develop .#native-clang11StdenvPackages

sleep 1

nix-shell --command "./bootstrap.sh"
nix-shell --command "./configure $configureFlags --prefix=$PREFIX_DIR"
nix-shell --command "make -j $NIX_BUILD_CORES"
nix-shell --command "make install"
nix-shell --command "make installcheck -j $NIX_BUILD_CORES"
