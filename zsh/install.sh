#!/bin/bash

package_name=zsh
package_manager=paru

if type -P $package_manager &>/dev/null; then
	paru -S --needed $package_name
fi

if ! type -P zsh &>/dev/null; then
	echo "Error: cannot install $package_name or $package_manager not found"
	exit 127
fi

if [[ ! -e "$HOME/.oh-my-zsh" ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

plugins=(zsh-users/zsh-autosuggestions)
plugins_folder="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

for plugin in "${plugins[@]}"; do
	name=${plugin#*\/}
	destination="$plugins_folder/$name"

	if [[ ! -e "$destination" ]]; then
		git clone "https://github.com/$plugin" "$destination"
	else
		echo "$name already installed"
	fi
done
