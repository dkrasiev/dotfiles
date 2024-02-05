#!/bin/bash

if [[ $1 = clean ]]; then
	rm -rf ~/.config/tmux
fi

paru -S --needed git tmux

if [[ ! -d ~/.config/tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi

~/.config/tmux/plugins/tpm/bin/install_plugins
