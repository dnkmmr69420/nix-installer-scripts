# Introduction

With this, you can install and run the nix package manager inside of distrobox with ease

## Installers

### Script for setting up a container and installing

This script sets up a distrobox container then installs nix inside of it.

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/nix-distrobox-setup.sh)
```

### Script for preexisting container

This script is good if you want to set up the container yourself and choose what container you want to use. Run this inside of distrobox.

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/nix-preexisting-container.sh)
```
