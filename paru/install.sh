#!/bin/bash

if [[ -x paru ]]; then
	exit 1
fi

sudo pacman -S --needed base-devel

cd paru || exit

git clone https://aur.archlinux.org/paru.git
cd paru || exit

makepkg -si

cd ..
rm -rf paru

cd ..
