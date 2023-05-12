#!/bin/bash

echo "Preparing to install nix..."

sleep 5

sudo xbps-install -Sy wget boost-devel brotli-devel bzip2-devel gc-devel libcurl-devel
 liblzma-devel openssl-devel libsodium-devel sqlite-devel
 libseccomp-devel editline-devel jq-devel libarchive-devel
 gtest-devel lowdown-devel json-c++ curl pkg-config flex tar xz automake autoconf-archive mdBook jq
 busybox-static lowdown
sudo xbps-install -Sy nix

echo "linking services"

sleep 1

sudo ln -s /etc/sv/nix-daemon /var/service/

sudo source /etc/profile

"setting up configs..."

bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/backup-scripts/create-backup.sh)

sleep 5

bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-scripts/nix-sudo-path.sh)

echo "Modifying configurations"

sleep 1

sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix.conf
sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh

sleep 1

echo "Installation has finnished"
