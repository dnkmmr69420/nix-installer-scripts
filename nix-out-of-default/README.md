# Info

Have you ever been close to accidently bricking nix by typing `sudo nix profile remove 1` instead of `sudo nix profile remove 2`? Well this puts nix itself in /nix/nix/nix (the last nix is the symlink to nix in the nix store) This script also changes the systemd units to execute the nix built in /nix/nix/nix. This script also provides commands that will update the out of default profile nix as well. This script runs `nix build nixpkgs#nix --out-link /nix/nix/nix` and nix won't be part of the default profile too. This script also links the binaries either in /usr or /usr/local. and also the share directories as well.

## Commands

This provides the usual nix commands but a few extras for managing this made by myself.

- `update-nix` This updates the nix out of profile installation
- `reset-nix` This runs nix from `/nix/nix/fallback/bin/nix` instead of the default `/nix/nix/nix/bin/nix` but it does the same thing.
- `update-nix-fallback` This updates nix in the fallback directory

## Fallback nix

The fallback nix is there in case if something happens to the regular nix. It should really be only used when you run `reset-nix` but the directory for fallback nix is `/nix/nix/fallback`



## Scripts

### Main script

```bash
curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/setup.sh | bash -s /usr/local
```
### Link

```bash
curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/build-scripts/nix-link.sh | bash -s /usr/local
```

### Script with no link

```bash
curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-out-of-default/setup-nolink.sh | bash
```

### Run these commands if you wanna remove nix from nix-default so only the nix out of default exists

```bash
sudo nix profile remove 0 ; sudo nix profile remove 0
```
