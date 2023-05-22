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

sleep 1

nix-shell --command "cd /opt/nix-git/nix ; /opt/nix-git/nix/bootstrap.sh ; sleep 1 ; /opt/nix-git/nix/configure $configureFlags --prefix=/opt/nixusr ; sleep 2 ; make -j $NIX_BUILD_CORES ; sleep 1 ; make install ; make installcheck -j $NIX_BUILD_CORES"
