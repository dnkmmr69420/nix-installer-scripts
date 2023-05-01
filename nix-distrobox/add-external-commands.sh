#!/bin/bash
[ -f /run/host/usr/bin/flatpak ] && sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/flatpak
[ -f /run/host/usr/bin/rpm ] && sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/rpm
[ -f /run/host/usr/bin/dpkg ] && sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/dpkg
[ -f /run/host/usr/bin/pacman ] && sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/pacman
[ -f /run/host/usr/bin/xbps-querry ] && sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/xbps-querry
[ -f /run/host/usr/bin/emerge ] && sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/emerge
[ -f /run/host/usr/bin/eopkg ] && sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/eopkg
[ -f /run/host/usr/bin/snap ] && sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/snap
sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/distrobox
[ -f /run/host/usr/bin/podman ] && sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/podman
[ -f /run/host/usr/bin/docker ] && sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/docker
