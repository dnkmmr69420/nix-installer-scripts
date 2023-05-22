#!/usr/bin/sudo nix-shell

cd /opt/nix-git/nix
/opt/nix-git/nix/bootstrap.sh
sleep 1
/opt/nix-git/nix/configure $configureFlags --prefix=/opt/nixusr
sleep 2
make -j $NIX_BUILD_CORES
sleep 1
make install
make installcheck $NIX_BUILD_CORES
