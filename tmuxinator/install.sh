#!/bin/bash

paru -S --needed rubygems

if [[ -x tmuxinator ]]; then
	exit 1
fi

gem install tmuxinator
