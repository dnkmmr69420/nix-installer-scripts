#!/usr/bin/sudo bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

mkdir -p /nix/nix
nix build nixpkgs#nix --out-link /nix/nix/nix
nix build nixpkgs#nix --out-link /nix/nix/fallback
nix build nixpkgs#cacert --out-link /nix/nix/cacert
nix build nixpkgs#cacert --out-link /nix/nix/cacart-fallback
echo "if you don't have selinux and restorecon can't be found, ignore the error"
restorecon -RF /nix
