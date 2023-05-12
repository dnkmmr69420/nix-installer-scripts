SHELL=/bin/bash

all:
  @echo "you need to select an installation option"

normal:
  @echo "Running normal installer..."
  bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/regular-installer.sh)

selinux:
  @echo "Running selinux installer..."
  bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/regular-nix-installer-selinux.sh)
