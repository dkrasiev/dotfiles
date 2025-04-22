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
