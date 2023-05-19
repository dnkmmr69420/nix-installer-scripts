#!/bin/bash

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
