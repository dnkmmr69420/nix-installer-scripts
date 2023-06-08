#!/bin/bash
sudo echo "Uninstalling nix..."

if [[ ! -d /etc/nix ]] ; then
  echo "Nix doesn't look like it has been installed so it has nothing to uninstall"
fi

sudo systemctl stop nix-daemon.service
sudo systemctl disable nix-daemon.socket nix-daemon.service
sudo systemctl daemon-reload
sudo rm -f /etc/systemd/system/nix-daemon.service /etc/systemd/system/nix-daemon.socket
sudo rm -f /etc/tmpfiles.d/nix-daemon.conf
sudo rm -rf /nix/* /var/lib/nix /etc/nix /etc/profile.d/nix.sh ~root/.nix-profile ~root/.nix-defexpr ~root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels
sudo rm -rf /etc/systemd/system/mkdir-rootfs@.service /etc/systemd/system/nix.mount /etc/systemd/system/nix-daemon.service.d/override.conf

for i in $(seq 1 32); do
  sudo userdel nixbld$i
done

sudo groupdel nixbld

sudo mv /etc/bashrc.backup-before-nix /etc/bashrc


if [[ ! -f /etc/zshrc.backup-before-nix ]] ; then
  sudo rm -f /etc/zshrc
fi

if [[ -f /etc/zshrc.backup-before-nix ]] ; then
  sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
fi

if [[ -f /etc/bash.bashrc.backup-before-nix ]] ; then
  sudo mv /etc/bash.bashrc.backup-before-nix /etc/bash.bashrc
fi

if [[ ! -f /etc/bash.bashrc.backup-before-nix ]] ; then
  sudo rm -f /etc/bash.bashrc
fi


sudo rm -f /usr/local/bin/nix
sudo rm -f /usr/local/bin/nix-shell
sudo rm -f /usr/local/bin/nix-env
sudo rm -f /usr/local/bin/nix-build
sudo rm -f /usr/local/bin/nix-channel
sudo rm -f /usr/local/bin/nix-collect-garbage
sudo rm -f /usr/local/bin/nix-copy-closure
sudo rm -f /usr/local/sbin/nix-daemon
sudo rm -f /usr/local/bin/nix-hash
sudo rm -f /usr/local/bin/nix-instantiate
sudo rm -f /usr/local/bin/nix-prefetch-url
sudo rm -f /usr/local/bin/nix-store
sudo rm -f /usr/local/sbin/reset-nix
sudo rm -f /usr/local/sbin/update-nix
sudo rm -f /usr/local/sbin/update-nix-fallback
sudo rm -f /usr/local/share/bash-completion/completions/nix
sudo rm -f /usr/local/share/doc/nix
sudo rm -f /usr/local/share/fish/vendor_completions.d/nix.fish
sudo rm -f /usr/local/share/zsh/site-functions/_nix
sudo rm -f /usr/local/share/zsh/site-functions/run-help-nix
