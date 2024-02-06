#!/bin/bash

paru -S --needed neovim ripgrep

../lazygit/install.sh

config_path="$HOME/.config/nvim"

if [[ -d "$config_path" ]]; then
	exit 1
fi

if [[ $1 == clean ]]; then
	rm -rf ~/.local/share/nvim ~/.local/share/nvim.bak
	rm -rf ~/.local/state/nvim ~/.local/state/nvim.bak
	rm -rf ~/.cache/nvim ~/.cache/nvim.bak
fi

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
