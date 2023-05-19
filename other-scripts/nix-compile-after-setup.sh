#!/bin/bash

echo "Type in password to continue"
sudo echo "Continuing..."

PREFIX=$1

echo "Linking nix"
sudo ln -s /opt/nixusr/bin/nix $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-shell $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-env $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-build $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-channel $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-collect-garbage $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-copy-closure $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-daemon $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-hash $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-instantiate $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-prefetch-url $PREFIX/bin
sudo ln -s /opt/nixusr/bin/nix-store $PREFIX/bin

echo "
sudo rm -f /etc/systemd/system/nix-daemon.service
sudo rm -f /etc/systemd/system/nix-daemon.socket
sudo cp /opt/nixusr/lib/systemd/system/nix-daemon.service /etc/systemd/system/nix-daemon.service
sudo cp /opt/nixusr/lib/systemd/system/nix-daemon.socket /etc/systemd/system/nix-daemon.socket
