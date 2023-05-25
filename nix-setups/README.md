# Description
These are scripts that are used for having an easy way to set up nix by default. Distro maintainers can simply put the `install-nix` file in `/usr/sbin` then all you got to do is type `sudo install-nix` then nix gets set up. You can even have a custom installer by creating `/etc/nix-setup/install-config.conf` and put the command (a curl command that executes a script) in that file.
