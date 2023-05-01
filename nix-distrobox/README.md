# Introduction

With this, you can install and run the nix package manager inside of distrobox with ease

This won't work if nix is installed on the host system

## Installation instructions

### Create distrobox container

Lets use alpine linux as the container distro but others may work but have not been tested

```bash
distrobox create -i alpine:latest -n nix-container
```

### Enter distrobox

Lets enter the distrobox container

```bash
distrobox enter nix-container
```

### Install nix

Run this script to install nix. Make sure you are in the container.

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/nix-distrobox-installer.sh)
```

### Optional Step: Link external commands to distrobox-host-exec

Link external commands so neofetch can detect system installed packages and you will be able to use distrobox, podman, or docker inside the container running those commands on the host system. RUN THIS INSIDE DISTROBOX

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/add-external-commands.sh)
```
