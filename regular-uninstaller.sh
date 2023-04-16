#!/bin/bash
sudo systemctl stop nix-daemon.service
sudo systemctl disable nix-daemon.socket nix-daemon.service
sudo systemctl daemon-reload
sudo rm /etc/systemd/system/nix-daemon.service /etc/systemd/system/nix-daemon.socket
sudo rm /etc/tmpfiles.d/nix-daemon.conf
sudo rm -rf /nix /etc/nix /etc/profile.d/nix.sh ~root/.nix-profile ~root/.nix-defexpr ~root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels
sudo rm -rf /etc/systemd/system/nix-daemon.service.d/override.conf

for i in $(seq 1 32); do
  sudo userdel nixbld$i
done

sudo groupdel nixbld
sudo mv /etc/bashrc.backup-before-nix /etc/bashrc
sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
