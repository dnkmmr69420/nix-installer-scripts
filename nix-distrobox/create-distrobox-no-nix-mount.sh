#!/bin/bash
echo "Creating distrobox container"
cd ~/nix-distrobox/bin
./distrobox-create -i alpine:latest -n nix-container
