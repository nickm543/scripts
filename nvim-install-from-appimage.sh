#!/bin/bash

# Script to install nvim.appimage into the path

if ! test -f ./nvim.appimage; then
    echo "Error: script must be run in the same directory as nvim.appimage"
    exit 1
fi

echo "Checking if neovim is already installed..."
if command -v nvim; then
    echo "Neovim is already installed, uninstalling..."
    sudo apt remove neovim -y
fi

echo "Running appimage-extract on appimage..."
chmod +x ./nvim.appimage
./nvim.appimage --appimage-extract

echo "Moving squashfs-root to /opt..."
sudo mkdir /opt/nvim
sudo mv ./squashfs-root /opt/nvim
sudo ln -s /opt/nvim/squashfs-root/usr/bin/nvim $HOME/.local/bin/

echo "Nvim should be installed now."
