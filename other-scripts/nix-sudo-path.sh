#!/bin/bash

sudo echo "Adding sudo path variables for nix"

SUDOPATHVARIABLE5=$(sudo printenv PATH)

sleep 1

sudo tee /etc/sudoers.d/nix-sudo-env <<EOF
Defaults  secure_path = /nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:$SUDOPATHVARIABLE5
EOF

echo "Finished adding sudo variables for nix"
