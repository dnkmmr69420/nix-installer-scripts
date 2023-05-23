#!/bin/bash

sudo echo "deleting and copying services..."
sudo rm -f /etc/systemd/system/nix-daemon.service
sudo rm -f /etc/systemd/system/nix-daemon.socket
sudo cp /nix/nix/nix/lib/systemd/system/nix-daemon.service /etc/systemd/system/nix-daemon.service
sudo cp /nix/nix/nix/lib/systemd/system/nix-daemon.socket /etc/systemd/system/nix-daemon.socket

sudo echo "Enabling services..."
sudo systemctl enable --now nix-daemon.socket
sudo systemctl enable --now nix-daemon.service
