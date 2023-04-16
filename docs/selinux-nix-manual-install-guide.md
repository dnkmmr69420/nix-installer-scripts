# Manual Steps

[back to the main readme](https://github.com/dnkmmr69420/nix-with-selinux)

## Step 1 SELinux

These commands are required for both Fedora Workstation and Fedora Silverblue
```bash
sudo semanage fcontext -a -t etc_t '/nix/store/[^/]+/etc(/.*)?'
sudo semanage fcontext -a -t lib_t '/nix/store/[^/]+/lib(/.*)?'
sudo semanage fcontext -a -t systemd_unit_file_t '/nix/store/[^/]+/lib/systemd/system(/.*)?'
sudo semanage fcontext -a -t man_t '/nix/store/[^/]+/man(/.*)?'
sudo semanage fcontext -a -t bin_t '/nix/store/[^/]+/s?bin(/.*)?'
sudo semanage fcontext -a -t usr_t '/nix/store/[^/]+/share(/.*)?'
sudo semanage fcontext -a -t var_run_t '/nix/var/nix/daemon-socket(/.*)?'
sudo semanage fcontext -a -t usr_t '/nix/var/nix/profiles(/per-user/[^/]+)?/[^/]+'
```

this will run everything in one command

```bash
sudo semanage fcontext -a -t etc_t '/nix/store/[^/]+/etc(/.*)?' ; sudo semanage fcontext -a -t lib_t '/nix/store/[^/]+/lib(/.*)?' ; sudo semanage fcontext -a -t systemd_unit_file_t '/nix/store/[^/]+/lib/systemd/system(/.*)?' ; sudo semanage fcontext -a -t man_t '/nix/store/[^/]+/man(/.*)?' ; sudo semanage fcontext -a -t bin_t '/nix/store/[^/]+/s?bin(/.*)?' ; sudo semanage fcontext -a -t usr_t '/nix/store/[^/]+/share(/.*)?' ; sudo semanage fcontext -a -t var_run_t '/nix/var/nix/daemon-socket(/.*)?' ; sudo semanage fcontext -a -t usr_t '/nix/var/nix/profiles(/per-user/[^/]+)?/[^/]+'
```

### Step 2 create SSL cert file

```bash
sudo mkdir /etc/systemd/system/nix-daemon.service.d
```


```bash
sudo tee /etc/systemd/system/nix-daemon.service.d/override.conf <<EOF
[Service]
Environment="NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt"
EOF
```

If you are on Fedora Workstation, skip past the [Fedora Silverblue](#fedora-silverblue) down to step 8, [Install Nix](#install-nix)

## Fedora Silverblue

If you are running Fedora Silverblue, you will need to follow these extra steps.

### Step 3 Create the nix directory in a persistent location
```bash
sudo mkdir /var/lib/nix
```

### Step 4 SELinux

You will want to the SELinux contexts for the mounted directory paths as well, it seems to help avoid some weird issues periodically.

```bash
sudo semanage fcontext -a -t etc_t '/var/lib/nix/store/[^/]+/etc(/.*)?'
sudo semanage fcontext -a -t lib_t '/var/lib/nix/store/[^/]+/lib(/.*)?'
sudo semanage fcontext -a -t systemd_unit_file_t '/var/lib/nix/store/[^/]+/lib/systemd/system(/.*)?'
sudo semanage fcontext -a -t man_t '/var/lib/nix/store/[^/]+/man(/.*)?'
sudo semanage fcontext -a -t bin_t '/var/lib/nix/store/[^/]+/s?bin(/.*)?'
sudo semanage fcontext -a -t usr_t '/var/lib/nix/store/[^/]+/share(/.*)?'
sudo semanage fcontext -a -t var_run_t '/var/lib/nix/var/nix/daemon-socket(/.*)?'
sudo semanage fcontext -a -t usr_t '/var/lib/nix/var/nix/profiles(/per-user/[^/]+)?/[^/]+'
```

This will run everything in one command

```bash
sudo semanage fcontext -a -t etc_t '/var/lib/nix/store/[^/]+/etc(/.*)?' ; sudo semanage fcontext -a -t lib_t '/var/lib/nix/store/[^/]+/lib(/.*)?' ; sudo semanage fcontext -a -t systemd_unit_file_t '/var/lib/nix/store/[^/]+/lib/systemd/system(/.*)?' ; sudo semanage fcontext -a -t man_t '/var/lib/nix/store/[^/]+/man(/.*)?' ; sudo semanage fcontext -a -t bin_t '/var/lib/nix/store/[^/]+/s?bin(/.*)?' ; sudo semanage fcontext -a -t usr_t '/var/lib/nix/store/[^/]+/share(/.*)?' ; sudo semanage fcontext -a -t var_run_t '/var/lib/nix/var/nix/daemon-socket(/.*)?' ; sudo semanage fcontext -a -t usr_t '/var/lib/nix/var/nix/profiles(/per-user/[^/]+)?/[^/]+'
```

## Service files


### Step 5 `/etc/systemd/system/mkdir-rootfs@.service`
```unit file (systemd)
[Unit]
Description=Enable mount points in / for ostree
ConditionPathExists=!%f
DefaultDependencies=no
Requires=local-fs-pre.target
After=local-fs-pre.target

[Service]
Type=oneshot
ExecStartPre=chattr -i /
ExecStart=mkdir -p '%f'
ExecStopPost=chattr +i /
```
This one is experimental but this does it with the tee command. copy and paste it into the terminal. Don't do it if you already used a text editor to copy and paste the `mkdir-rootfs@.service` with a text editor.

```bash
sudo tee /etc/systemd/system/mkdir-rootfs@.service <<EOF
[Unit]
Description=Enable mount points in / for ostree
ConditionPathExists=!%f
DefaultDependencies=no
Requires=local-fs-pre.target
After=local-fs-pre.target

[Service]
Type=oneshot
ExecStartPre=chattr -i /
ExecStart=mkdir -p '%f'
ExecStopPost=chattr +i /
EOF
```

### Step 6 `/etc/systemd/system/nix.mount`
```unit file (systemd)
[Unit]
Description=Nix Package Manager
DefaultDependencies=no
After=mkdir-rootfs@nix.service
Wants=mkdir-rootfs@nix.service
Before=sockets.target
After=ostree-remount.service
BindsTo=var.mount

[Mount]
What=/var/lib/nix
Where=/nix
Options=bind
Type=none
```

This one is experimental but this does it with the tee command. copy and paste it into the terminal. Don't do it if you already used a text editor to copy and paste the `nix.mount` with a text editor.

```bash
sudo tee /etc/systemd/system/nix.mount <<EOF
[Unit]
Description=Nix Package Manager
DefaultDependencies=no
After=mkdir-rootfs@nix.service
Wants=mkdir-rootfs@nix.service
Before=sockets.target
After=ostree-remount.service
BindsTo=var.mount

[Mount]
What=/var/lib/nix
Where=/nix
Options=bind
Type=none
EOF
```

### Step 7

Enable and mount the nix mount and reset the SELinux context. 
```bash
# Ensure systemd picks up the newly created units
sudo systemctl daemon-reload
# Enable the nix mount on boot.
sudo systemctl enable nix.mount
# Mount the nix mount now.
sudo systemctl start nix.mount
# R = recurse, F = full context (not just target)
sudo restorecon -RF /nix
```

Run all of this in one command

```bash
sudo systemctl daemon-reload ; sudo systemctl enable nix.mount ; sudo systemctl start nix.mount ; sudo restorecon -RF /nix
```

## Install Nix

After you have configured SELinux (and if you are on Silverblue, configured a `/nix` mount), it's time to install [Nix](https://github.com/NixOS/nix).

### Step 8

Temorarly set selinux to "permissive"

```bash
sudo setenforce Permissive
```


### Step 9 Install nix

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

## Step 10 Copy Service Files

now copy the service file

```bash
# Remove the linked services
sudo rm -f /etc/systemd/system/nix-daemon.{service,socket}
# Manually copy the services.
sudo cp /nix/var/nix/profiles/default/lib/systemd/system/nix-daemon.{service,socket} /etc/systemd/system/
# R = recurse, F = full context (not just target)
sudo restorecon -RF /nix
# Ensure systemd picks up the newly created units
sudo systemctl daemon-reload
# Start (and enable) the nix-daemon socket
sudo systemctl enable --now nix-daemon.socket
```
run all of this in one command

```bash
sudo rm -f /etc/systemd/system/nix-daemon.{service,socket} ; sudo cp /nix/var/nix/profiles/default/lib/systemd/system/nix-daemon.{service,socket} /etc/systemd/system/ ; sudo restorecon -RF /nix ; sudo systemctl daemon-reload ; sudo systemctl enable --now nix-daemon.socket
```

If you are running silverblue and the services failed to copy, try this instead. instead copying from /nix, it coppies from /var/lib/nix instead.

```bash
# Remove the linked services
sudo rm -f /etc/systemd/system/nix-daemon.{service,socket}
# Manually copy the services.
sudo cp /var/lib/nix/var/nix/profiles/default/lib/systemd/system/nix-daemon.{service,socket} /etc/systemd/system/
# R = recurse, F = full context (not just target)
sudo restorecon -RF /nix
# Ensure systemd picks up the newly created units
sudo systemctl daemon-reload
# Start (and enable) the nix-daemon socket
sudo systemctl enable --now nix-daemon.socket
```

## Finishing up

### Step 11 Enable selinux

```bash
sudo setenforce Enforcing
```

### Step 12 Reboot your system

reboot the system for the changes to take effect

```bash
systemctl reboot
```

## Optional Steps

### Install nix backup before using nix at all

```bash
bash <(curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-with-selinux/main/create-backup.sh)
```

### modify nix-daemon to add units to bind nix.mount

Optionally, you may manually modify the `nix-daemon` units to add a bind to `nix.mount` to ensure the units activate and deactivate properly if the mount fails or if the mount is unmounted while the daemon is running.  Place the following at the bottom of the `[Unit]` section in both the `nix-daemon.socket` and `nix-daemon.service` units.

```
After=nix.mount
BindsTo=nix.mount
```

You have just installed Nix and should be ready to rock!

NOTE: the `nix-daemon.socket` unit will automatically start `nix-daemon.service` whenever it is needed, there is no need to enable or manually start the service.

### Edit /etc/nix/nix.conf to enable flakes and profile package manager

I find the `nix profile` package manager much better than `nix-env`

edit `/etc/nix/nix.conf` and add this

```
experimental-features = nix-command flakes
```

now you can use the `nix profile` command and I think it is better than `nix-env`

### nix graphical icons

It has its own [guide](https://github.com/dnkmmr69420/nix-graphical-app-icon-guide)

#### Single User

add this to the end of `~/.bashrc`

```bash
XDG_DATA_DIRS="$HOME/.nix-profile/share:/nix/var/nix/profiles/default/share:$XDG_DATA_DIRS"
```

#### Multiuser

type this command

```bash
sudo tee /etc/profile.d/nix-app-icons.sh <<EOF
XDG_DATA_DIRS="$HOME/.nix-profile/share:/nix/var/nix/profiles/default/share:$XDG_DATA_DIRS"
EOF
```



## Distros that I have tested this on

1. Fedora Silverblue 37: Multiple Times: Successful
2. Fedora Workstation 37: Once: Successful
3. Centos 7: Once: Successful
4. Rocky Linux 9.1: Once: Successful
