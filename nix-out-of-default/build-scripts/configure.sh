#!/bin/bash

sudo echo "Configuring nix..."

sudo tee /etc/profile.d/nix.sh <<EOF
if [ -e '/nix/nix/nix/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/nix/nix/etc/profile.d/nix-daemon.sh'
fi
EOF

sudo mkdir -p /nix/nix/etc
sudo tee /nix/nix/etc/profile.sh <<EOF
# Nix
if [ -e '/nix/nix/nix/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/nix/nix/etc/profile.d/nix-daemon.sh'
fi
# End Nix
EOF

sudo cat /nix/nix/etc/profile.sh >> /etc/bashrc
sudo cat /nix/nix/etc/profile.sh >> /etc/zshrc

sudo tee /etc/sudoers.d/nix-ssl-cert-file <<EOF
Defaults  env_keep += "NIX_SSL_CERT_FILE"
EOF

sudo mkdir -p /etc/systemd/system/nix-daemon.service.d

sudo tee /etc/systemd/system/nix-daemon.service.d/override.conf <<EOF
[Service]
Environment="NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt"
EOF
