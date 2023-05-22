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

sudo echo "linking share files..."
sudo mkdir -p $PREFIX/share/bash-completion/completions
sudo ln -s /nix/var/nix/profiles/nix/share/bash-completion/completions/nix $PREFIX/share/bash-completion/completions/nix
sudo mkdir -p $PREFIX/share/doc
sudo ln -s /nix/var/nix/profiles/nix/share/doc/nix $PREFIX/share/doc/nix
sudo mkdir -p $PREFIX/share/fish/vendor_completions.d
sudo ln -s /nix/var/nix/profiles/nix/share/fish/vendor_completions.d/nix.fish $PREFIX/share/fish/vendor_completions.d/nix.fish
sudo mkdir -p $PREFIX/share/zsh/site-functions
sudo ln -s /nix/var/nix/profiles/nix/share/zsh/site-functions/_nix $PREFIX/share/zsh/site-functions/_nix
sudo ln -s /nix/var/nix/profiles/nix/share/zsh/site-functions/run-help-nix $PREFIX/share/zsh/site-functions/run-help-nix

sudo echo "deleting and copying services..."
sudo rm -f /etc/systemd/system/nix-daemon.service
sudo rm -f /etc/systemd/system/nix-daemon.socket
sudo cp /nix/var/nix/profiles/nix/lib/systemd/system/nix-daemon.service /etc/systemd/system/nix-daemon.service
sudo cp /nix/var/nix/profiles/nix/lib/systemd/system/nix-daemon.socket /etc/systemd/system/nix-daemon.socket

sudo echo "Configuring nix..."
sudo tee /etc/profile.d/nix.sh <<EOF
if [ -e '/nix/var/nix/profiles/nix/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/nix/etc/profile.d/nix-daemon.sh'
fi
EOF
sudo tee /etc/sudoers.d/nix-ssl-cert-file <<EOF
Defaults  env_keep += "NIX_SSL_CERT_FILE"
EOF

sudo echo "If you don't have selinux installed and you get errors about restorecon not being found, ignore the errors."
sudo restorecon -RF /nix

sudo echo "Enabling services..."
sudo systemctl enable --now nix-daemon.socket
sudo systemctl enable --now nix-daemon.service


sudo nix profile remove 0
sudo nix profile remove 0
