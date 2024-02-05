#!/bin/bash

source .scripts/modules.sh

for module in "${modules[@]}"; do
	stow --adopt "$module"
done
