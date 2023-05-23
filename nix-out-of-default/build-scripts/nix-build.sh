#!/bin/bash
sudo mkdir -p /nix/nix
sudo nix build nixpkgs#nix --out-link /nix/nix/nix
sudo restorecon -RF /nix
