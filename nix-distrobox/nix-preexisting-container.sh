#!/usr/bin/env bash

# This is skipping the container creation process

echo "what distrobox container would you like to use?"
read container_name

if type -p distrobox> /dev/null; then
	echo "Installing nix..."
	sleep 30
	distrobox enter $container_name -- sh <(curl -L https://nixos.org/nix/install) --no-daemon
	sleep 3
	distrobox enter $container_name -- sudo rm -f /etc/nix/nix.conf ; sudo wget -P /etc/nix https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/nix-distrobox/nix.conf
	distrobox enter $container_name -- sudo rm -f /etc/profile.d/nix-app-icons.sh ; sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-files/nix-app-icons.sh
	echo "Finished installing nix"
	exit 0
else
	echo "Aborting installer. distrobox is not installed."
	exit 1
fi
