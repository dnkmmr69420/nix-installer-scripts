# Intro

My scripts already run these commands automaticly but if you use a different installer, you can run these scripts separately

## Commands

### add `experimental-features = nix-command flakes` to `/etc/nix/nix.conf`or `~/.config/nix/nix.conf`

#### Multiuser

WARNING: THIS OVERWRITES THE CONFIG SO ANYTHING THAT IS ADDED TO IT IS LOST

```bash
sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix.conf
```

#### Singeluser

```bash
mkdir -p ~/.config/nix ; echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Have nix .desktop app icons show up in your DE

It makes `/etc/profile.d/nix-app-icons.sh` which contains `XDG_DATA_DIRS="$HOME/.nix-profile/share:/nix/var/nix/profiles/default/share:$XDG_DATA_DIRS"`

#### Multiuser

```bash
sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installers/main/nix-app-icons.sh
```

#### Singleuser

add this to the end of ~/.bashrc

```bash
XDG_DATA_DIRS="$HOME/.nix-profile/share:/nix/var/nix/profiles/default/share:$XDG_DATA_DIRS"
```

### Have sudo detect nix commands

This adds all the nix commands like nix, nix-shell, nix-env, to `/usr/local/bin`

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-scripts/nix-linker.sh)
```
