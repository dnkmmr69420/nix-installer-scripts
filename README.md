# nix-installer-scripts
Various scripts to install the nix package manager

## Installers

### Regular installer for non-selinux systems

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/regular-installer.sh)
```

### Installer for selinux systems that aren't immutable

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/regular-nix-installer-selinux.sh)
```

### Installer for rpm-ostree based systems like silverblue/kinoite/ublue

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/silverblue-nix-installer.sh
```
