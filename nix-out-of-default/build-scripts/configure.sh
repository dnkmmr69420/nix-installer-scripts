#!/bin/bash

sudo echo "Configuring nix..."

sudo tee /etc/profile.d/nix.sh <<EOF
if [ -e '/opt/nixusr/etc/profile.d/nix-daemon.sh' ]; then
  . '/opt/nixusr/etc/profile.d/nix-daemon.sh'
fi
EOF

sudo tee /etc/sudoers.d/nix-ssl-cert-file <<EOF
Defaults  env_keep += "NIX_SSL_CERT_FILE"
EOF

sudo mkdir -p /etc/systemd/system/nix-daemon.service.d

sudo tee /etc/sudoers.d/nix-ssl-cert-file <<EOF
Defaults  env_keep += "NIX_SSL_CERT_FILE"
EOF
