#!/bin/bash

sudo echo "Creating services..."

sleep 3

sudo tee /etc/systemd/system/nix-directory.service <<EOF
[Unit]
Description=Create a `/nix` directory to be used for bind mounting
PropagatesStopTo=nix-daemon.service
PropagatesStopTo=nix.mount
DefaultDependencies=no

[Service]
Type=oneshot
ExecStart=steamos-readonly disable
ExecStart=mkdir -vp /nix
ExecStart=chmod -v 0755 /nix
ExecStart=chown -v root /nix
ExecStart=chgrp -v root /nix
ExecStart=steamos-readonly enable
ExecStop=steamos-readonly disable
ExecStop=rmdir /nix
ExecStop=steamos-readonly enable
RemainAfterExit=true
EOF

sleep 1

