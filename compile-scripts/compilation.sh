#!/usr/bin/sudo nix-shell

mkdir -p /opt/nix-git
cd /opt/nix-git
git clone https://github.com/NixOS/nix.git
cd /opt/nix-git/nix
nix develop
nix develop .#native-clang11StdenvPackages
