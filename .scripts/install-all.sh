#!/bin/bash

source .scripts/modules.sh

for module in "${modules[@]}"; do
	install="./$module/install.sh"

	if [[ -f $install ]]; then
		chmod +x "$install"
		echo "installing $module"

		$install

		case $? in
		0)
			echo "OK"
			;;
		1)
			echo "$module already installed"
			;;
		*)
			echo "FAILED"
			;;
		esac

		echo
	fi
done
