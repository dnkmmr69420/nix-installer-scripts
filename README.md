# nix-installer-scripts
Various scripts to install the nix package manager

This may break if something other than bash is not the default login shell so have bash be the default shell. It will be better to make a profile on your terminal application and have a different shell instance that way. If the commands itself give some sort of error, use bash as a shell. Type `bash` into the terminal to get to bash.

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

### Installer for opensuse microos

first run this

```bash
sudo transactional-update run mksubvolume /nix
```

Reboot

Then run the script

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/nix-microos-installer.sh)
```

### Void linux installer

First check if curl is installed

```bash
sudo xbps-install -S curl
```
use the bash shell

```bash
bash
```

Install nix

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/installer-scripts/nix-void-linux-installer.sh)
```

### [Nix inside distrobox installer and setup](https://github.com/dnkmmr69420/nix-installer-scripts/tree/main/nix-distrobox)

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

[Compile from source](https://github.com/dnkmmr69420/nix-installer-scripts/blob/main/docs/compile-from-source.md)

## Some useful nix tools

Fleek: [Github-page](https://github.com/ublue-os/fleek) [Website](https://getfleek.dev/)

Nix Portable: [Main-Page](https://github.com/DavHau/nix-portable) [My-nix-portable-utilities](https://github.com/dnkmmr69420/nix-portable-utils)

## Shorten link

https://tinyurl.com/nxscrpts
