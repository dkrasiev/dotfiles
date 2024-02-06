#!/bin/bash

package_name="tmuxinator"

paru -S --needed rubygems

if type -P "$package_name"; then
	exit 1
fi

gem install "$package_name"
