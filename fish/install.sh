#!/bin/bash

paru -S --needed fish fisher
# or use this
# echo "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source" | fish

echo "fisher update" | fish
echo "nvm install lts" | fish
