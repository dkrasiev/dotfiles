#!/bin/bash

if type -P paru; then
	exit 1
fi

deps=(pacman git)
echo "${deps[@]}"
echo "${deps[*]}"

for dep in "${deps[@]}"; do
	if ! type -P "$dep"; then
		echo "Error: dependency $dep not found"
		exit 2
	fi
done

if ! type -P pacman || ! type -P git; then
	echo
	exit 2
fi

sudo pacman -S --needed base-devel

cd paru || exit

git clone https://aur.archlinux.org/paru.git
cd paru || exit

makepkg -si

cd ..
rm -rf paru

cd ..
