#!/bin/bash

if [[ $1 = clean ]]; then
	rm -rf ~/.config/tmux
fi

if type -P paru; then
	paru -S --needed git tmux
fi

deps=(tmux git)

for dep in "${deps[@]}"; do
	if ! type -P "$dep"; then
		echo "Cannot install tmux config"
		echo "Error: dependency $dep not found"
		exit 2
	fi
done

if [[ ! -d ~/.config/tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi

~/.config/tmux/plugins/tpm/bin/install_plugins
