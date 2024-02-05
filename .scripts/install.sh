#!/bin/bash

# for git and etc
paru -S --needed base-devel

# install all
./.scripts/install-all.sh

# link dotfiles
./.scripts/stow-all.sh
