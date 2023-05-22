#!/bin/bash
nix build github:nixos/nix --out-link /opt/nix
nix build github:nixos/nix#nix-static 
