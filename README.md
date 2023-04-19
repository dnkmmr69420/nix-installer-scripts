# nix-installer-scripts
Various scripts to install the nix package manager

## Installers

### Regular installer for non-selinux systems

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/regular-installer.sh)
```

### Installer for selinux systems that aren't immutable (Fedora workstation, RHEL, centos stream, rocky alma or oracle linux)

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/regular-nix-installer-selinux.sh)
```

### Installer for rpm-ostree based systems like silverblue/kinoite/ublue

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/silverblue-nix-installer.sh)
```

## Uninstallers

### Regular uninstaller for both non-selinux and selinux muttable systems

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/uninstaller-scripts/regular-uninstaller.sh)
```

### Silverblue nix uninstaller

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/uninstaller-scripts/silverblue-nix-uninstaller.sh)
```

## Other useful docs

[Extra Scripts](https://github.com/dnkmmr69420/nix-installer-scripts/blob/main/docs/extra-scripts.md)

[Nix with selinux manual install guide](https://github.com/dnkmmr69420/nix-installer-scripts/blob/main/docs/selinux-nix-manual-install-guide.md)

[Old github repos that this repo has replaced list](https://github.com/dnkmmr69420/nix-installer-scripts/blob/main/docs/my-old-nix-github-repos.md)

## Some useful nix tools

Fleek: [Github-page](https://github.com/ublue-os/fleek) [Website](https://getfleek.dev/)

Nix Portable: [Main-Page](https://github.com/DavHau/nix-portable) [My-nix-portable-utilities](https://github.com/dnkmmr69420/nix-portable-utils)
