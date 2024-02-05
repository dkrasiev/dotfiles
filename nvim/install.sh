#!/bin/bash

paru -S --needed neovim ripgrep

../lazygit/install.sh

config_path="$HOME/.config/nvim"

if [[ -d "$config_path" ]]; then
	# echo "Backup $config_path to $config_path.bak"
	# cp -r "$config_path" "$config_path.bak"
	# rm -rf "$config_path"

	echo "Neovim config already installed, skipping"
	exit 1
fi

# rm -rf ~/.local/share/nvim ~/.local/share/nvim.bak
# rm -rf ~/.local/state/nvim ~/.local/state/nvim.bak
# rm -rf ~/.cache/nvim ~/.cache/nvim.bak

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
