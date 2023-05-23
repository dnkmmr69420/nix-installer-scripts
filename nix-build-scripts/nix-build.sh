#!/bin/bash
sudo mkdir -p /opt/nix/nix
sudo nix build nixpkgs#nix --out-link /opt/nix/nix
