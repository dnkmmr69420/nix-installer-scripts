#!/bin/bash

PREFIX=$1

echo "Enter your password to create a separate profile from the default just for nix and remove nix from the old profile"
sudo echo "Continuing"
sudo nix-env -iA nixpkgs.nix nixpkgs.cacert --profile /nix/var/nix/profiles/nix

sudo ln -s /nix/var/nix/profiles/nix/bin/nix $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-shell $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-env $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-build $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-channel $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-collect-garbage $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-copy-closure $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-daemon $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-hash $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-instantiate $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-prefetch-url $PREFIX/bin
sudo ln -s /nix/var/nix/profiles/nix/bin/nix-store $PREFIX/bin


sudo nix profile remove 0
sudo nix profile remove 0
