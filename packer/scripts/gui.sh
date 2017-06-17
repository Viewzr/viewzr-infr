#!/bin/bash -eux

echo "==> Installing Graphical Interface"
sudo dnf -y groupinstall "Development and Creative Workstation" gnome
echo "==> Setting server to use GUI on startup"
sudo systemctl set-default graphical.target
