SHELL=/bin/bash

all:
  @sudo echo "you need to select an installation option"

normal:
  @sudo echo "Running normal nix installer..."
  bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/regular-installer.sh)

selinux:
  @sudo echo "Running nix selinux installer..."
  bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/regular-nix-installer-selinux.sh)

ostree:
  @sudo echo "Running ostree nix installer..."
  bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/silverblue-nix-installer.sh)

microos:
  @sudo echo "Make sure that /nix is created before running this, press ctrl c to quit and make the /nix subvolume if it is not created. Continuing in 10 seconds"
  @sudo echo sleep 10
  bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/nix-microos-installer.sh)
  
void:
  @echo "Installing void linux nix installer"
  sudo xbps-install -S curl
  bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/nix-void-linux-installer.sh)

normal-uninstaller:
  @echo "Uninstalling nix"
  bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/uninstaller-scripts/regular-uninstaller.sh)
  
silverblue-uninstaller:
  @echo "Uninstalling nix on silverblue"
  bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/uninstaller-scripts/silverblue-nix-uninstaller.sh)
