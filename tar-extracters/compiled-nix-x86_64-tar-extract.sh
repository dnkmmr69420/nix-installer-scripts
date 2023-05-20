#!/bin/bash
rm -f nixusr.tar.gz
wget https://github.com/dnkmmr69420/nix-installer-scripts/releases/download/nix-x86_64-1.01/nixusr.tar.gz
echo "enter password to continue extracting. This will overwite the current /opt/nixusr installation"
sudo echo "Extracting nixusr.tar.gz"
sudo rm -rf /opt/nixusr
sudo tar -xf nixusr.tar.gz -C /
sudo echo "If don't have selinux installed and you get errors about restorecon command not being found, ignore it."
sudo restorecon -RF /opt/nixusr
