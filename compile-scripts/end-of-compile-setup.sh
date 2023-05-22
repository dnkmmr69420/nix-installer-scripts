#!/bin/bash

# current ver: 1.79.0

VERSION=$1

sudo echo "Copping libraries..."
sudo cp /nix/var/nix/profiles/default/lib/libboost_context.so /opt/nixusr/lib
sudo cp /nix/var/nix/profiles/default/lib/libboost_context.so.$VERSION /opt/nixusr/lib
sudo cp /nix/var/nix/profiles/default/lib/libboost_system.so /opt/nixusr/lib
sudo cp /nix/var/nix/profiles/default/lib/libboost_system.so.$VERSION /opt/nixusr/lib
sudo cp /nix/var/nix/profiles/default/lib/libboost_thread.so /opt/nixusr/lib
sudo cp /nix/var/nix/profiles/default/lib/libboost_thread.so.$VERSION /opt/nixusr/lib

sudo ln -s /etc/nix /opt/nixusr/etc
