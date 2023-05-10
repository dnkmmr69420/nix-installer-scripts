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

sudo tee /etc/systemd/system/nix.mount <<EOF
[Unit]
Description=Mount `/home/nix` on `/nix`
PropagatesStopTo=nix-daemon.service
PropagatesStopTo=nix-directory.service
After=nix-directory.service
Requires=nix-directory.service
ConditionPathIsDirectory=/nix
DefaultDependencies=no
RequiredBy=nix-daemon.service
RequiredBy=nix-daemon.socket

[Mount]
What=/home/nix
Where=/nix
Type=none
DirectoryMode=0755
Options=bind
EOF

sleep 1

sudo tee /etc/systemd/system/ensure-symlinked-units-resolve.service <<EOF
[Unit]
Description=Ensure Nix related units which are symlinked resolve
After=nix.mount
Requires=nix-directory.service
Requires=nix.mount
DefaultDependencies=no

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/systemctl daemon-reload
ExecStart=/usr/bin/systemctl restart --no-block nix-daemon.socket

[Install]
WantedBy=sysinit.target
EOF
