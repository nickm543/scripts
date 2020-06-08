#!/bin/bash

# TODO: Download and install nerd fonts before setting up powerlevel10k

printf "Installing zsh...   "

# Install ZSH
sudo apt install -y zsh > /dev/null
printf "Done.\n"

printf "Installing curl and wget just in case they don't exist...   "

# Install curl/wget
sudo apt install -y curl wget >> /dev/null
printf "Done.\n"

printf "Installing oh-my-zsh...  "

# Get and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >> /dev/null
printf "Done.\n"

printf "Installing powerlevel10k for oh-my-zsh...   "

# Get and install powerlevel10k for oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k >> /dev/null
printf "Done.\n"

printf "Setting the ZSH_THEME variable in ~/.zshrc...   "

# Set the ZSH_THEME variable in ~/.zshrc
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

printf "Done.\n"

source ~/.zshrc
