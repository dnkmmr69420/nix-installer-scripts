#!/bin/bash
source /nix/nix/etc/nix-prefix.conf
PREFIX=$NIX_PREFIX_LOCATION

wget -P /nix/nix/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/bin/reset-nix
wget -P /nix/nix/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/bin/update-nix
wget -P /nix/nix/bin https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/bin/update-nix-fallback

chmod a+x /nix/nix/bin/reset-nix
chmod a+x /nix/nix/bin/update-nix
chmod a+x /nix/nix/bin/update-nix-fallback

ln -s /nix/nix/bin/reset-nix $PREFIX/sbin
ln -s /nix/nix/bin/update-nix $PREFIX/sbin
ln -s /nix/nix/bin/update-nix-fallback $PREFIX/sbin
