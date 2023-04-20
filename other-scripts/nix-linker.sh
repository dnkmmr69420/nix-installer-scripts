#!/bin/bash

# This creates symlinks of the nix commands in /nix/var/nix/profiles/default/bin to /usr/local/bin so sudo can work for them

sudo echo "Deleting existing files that have the same name if /usr/local/bin (if you have any)"

sleep 1

sudo rm -f /usr/local/bin/nix
sudo rm -f /usr/local/bin/nix-build
sudo rm -f /usr/local/bin/nix-channel
sudo rm -f /usr/local/bin/nix-collect-garbage
sudo rm -f /usr/local/bin/nix-copy-closure
sudo rm -f /usr/local/bin/nix-daemon
sudo rm -f /usr/local/bin/nix-env
sudo rm -f /usr/local/bin/nix-hash
sudo rm -f /usr/local/bin/nix-instantiate
sudo rm -f /usr/local/bin/nix-prefetch-url
sudo rm -f /usr/local/bin/nix-shell
sudo rm -f /usr/local/bin/nix-store

sudo echo "Now creating symlinks from /nix/var/nix/profiles/default/bin to /usr/local/bin"

sleep 1

sudo ln -s /nix/var/nix/profiles/default/bin/nix /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-build /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-channel /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-collect-garbage /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-copy-closure /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-daemon /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-env /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-hash /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-instantiate /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-prefetch-url /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-shell /usr/local/bin
sudo ln -s /nix/var/nix/profiles/default/bin/nix-store /usr/local/bin

sudo echo "Finished linking"
