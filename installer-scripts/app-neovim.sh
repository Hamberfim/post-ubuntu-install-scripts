#!/bin/bash

sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y neovim

if [ ! -d "$HOME/.config/nvim" ]; then
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    cd neotheme/
    cp catppuccin.lua ~/.config/nvim/lua/plugins/theme.lua
    cd
fi
