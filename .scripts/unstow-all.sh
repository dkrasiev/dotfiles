#!/bin/bash

source .scripts/modules.sh

for module in "${modules[@]}"; do
	stow -D "$module"
done
