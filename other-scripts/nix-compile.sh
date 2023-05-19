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

nix-shell --command "cd /opt/nix-git/nix ; /opt/nix-git/nix/bootstrap.sh ; /opt/nix-git/nix/configure $configureFlags --prefix=$PREFIX_DIR ; make -j $NIX_BUILD_CORES ; make install ; make installcheck -j $NIX_BUILD_CORES"
