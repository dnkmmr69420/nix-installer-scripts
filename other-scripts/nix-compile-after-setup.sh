#!/bin/bash

echo "Type in password to continue"
sudo echo "Continuing..."

PREFIX=$1

sudo echo "Linking nix..."
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

sudo echo "linking share files..."
sudo mkdir -p $PREFIX/share/bash-completion/completions
sudo ln -s /opt/nixusr/share/bash-completion/completions/nix $PREFIX/share/bash-completion/completions/nix
sudo mkdir -p $PREFIX/share/doc
sudo ln -s /opt/nixusr/share/doc/nix $PREFIX/share/doc/nix
sudo mkdir -p $PREFIX/share/fish/vendor_completions.d
sudo ln -s /opt/nixusr/share/fish/vendor_completions.d/nix.fish $PREFIX/share/fish/vendor_completions.d/nix.fish
sudo mkdir -p $PREFIX/share/zsh/site-functions
sudo ln -s /opt/nixusr/share/zsh/site-functions/_nix $PREFIX/share/zsh/site-functions/_nix
sudo ln -s /opt/nixusr/share/zsh/site-functions/run-help-nix $PREFIX/share/zsh/site-functions/run-help-nix

sudo echo "deleting and copying services..."
sudo rm -f /etc/systemd/system/nix-daemon.service
sudo rm -f /etc/systemd/system/nix-daemon.socket
sudo cp /opt/nixusr/lib/systemd/system/nix-daemon.service /etc/systemd/system/nix-daemon.service
sudo cp /opt/nixusr/lib/systemd/system/nix-daemon.socket /etc/systemd/system/nix-daemon.socket

sudo echo "Configuring nix..."
sudo ln -s /etc/nix /opt/nixusr/etc/nix
sudo tee /etc/profile.d/nix.sh <<EOF
if [ -e '/opt/nixusr/etc/profile.d/nix-daemon.sh' ]; then
  . '/opt/nixusr/etc/profile.d/nix-daemon.sh'
fi
EOF

sudo echo "Configuring selinux..."
sleep 3
sudo echo "If you don't have selinux installed and you get errors about the command not being found, Ignore them"
sudo semanage fcontext -a -t etc_t '/opt/nixusr/etc(/.*)?' ; sudo semanage fcontext -a -t lib_t '/opt/nixusr/lib(/.*)?' ; sudo semanage fcontext -a -t systemd_unit_file_t '/opt/nixusr/lib/systemd/system(/.*)?' ; sudo semanage fcontext -a -t man_t '/opt/nixusr/man(/.*)?' ; sudo semanage fcontext -a -t bin_t '/opt/nixusr/s?bin(/.*)?' ; sudo semanage fcontext -a -t usr_t '/opt/nixusr/share(/.*)?'
sudo semanage fcontext -a -t etc_t '/var/opt/nixusr/etc(/.*)?' ; sudo semanage fcontext -a -t lib_t '/var/opt/nixusr/lib(/.*)?' ; sudo semanage fcontext -a -t systemd_unit_file_t '/var/opt/nixusr/lib/systemd/system(/.*)?' ; sudo semanage fcontext -a -t man_t '/var/opt/nixusr/man(/.*)?' ; sudo semanage fcontext -a -t bin_t '/var/opt/nixusr/s?bin(/.*)?' ; sudo semanage fcontext -a -t usr_t '/var/opt/nixusr/share(/.*)?'
