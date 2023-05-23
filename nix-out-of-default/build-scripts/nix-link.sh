#!/bin/bash

PREFIX=$1

sudo echo "Linking binaries"
sudo ln -s /nix/nix/nix/bin/nix $PREFIX/bin
sudo ln -s /nix/nix/nix/bin/nix-shell $PREFIX/bin
sudo ln -s /nix/nix/nix/bin/nix-env $PREFIX/bin
sudo ln -s /nix/nix/nix/bin/nix-build $PREFIX/bin
sudo ln -s /nix/nix/nix/bin/nix-channel $PREFIX/bin
sudo ln -s /nix/nix/nix/bin/nix-collect-garbage $PREFIX/bin
sudo ln -s /nix/nix/nix/bin/nix-copy-closure $PREFIX/bin
sudo ln -s /nix/nix/nix/nix/bin/nix-daemon $PREFIX/sbin
sudo ln -s /nix/nix/nix/bin/nix-hash $PREFIX/bin
sudo ln -s /nix/nix/nix/bin/nix-instantiate $PREFIX/bin
sudo ln -s /nix/nix/nix/bin/nix-prefetch-url $PREFIX/bin
sudo ln -s /nix/nix/nix/bin/nix-store $PREFIX/bin
sudo ln -s /nix/nix/bin/reset-nix $PREFIX/sbin
sudo ln -s /nix/nix/bin/update-nix $PREFIX/sbin
sudo ln -s /nix/nix/bin/update-nix-fallback $PREFIX/sbin

sudo echo "linking share files..."
sudo mkdir -p $PREFIX/share/bash-completion/completions
sudo ln -s /nix/nix/nix/share/bash-completion/completions/nix $PREFIX/share/bash-completion/completions/nix
sudo mkdir -p $PREFIX/share/doc
sudo ln -s /nix/nix/nix/share/doc/nix $PREFIX/share/doc/nix
sudo mkdir -p $PREFIX/share/fish/vendor_completions.d
sudo ln -s /nix/nix/nix/share/fish/vendor_completions.d/nix.fish $PREFIX/share/fish/vendor_completions.d/nix.fish
sudo mkdir -p $PREFIX/share/zsh/site-functions
sudo ln -s /nix/nix/nix/share/zsh/site-functions/_nix $PREFIX/share/zsh/site-functions/_nix
sudo ln -s /nix/nix/nix/share/zsh/site-functions/run-help-nix $PREFIX/share/zsh/site-functions/run-help-nix


