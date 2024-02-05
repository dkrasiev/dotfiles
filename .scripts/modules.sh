#!/bin/bash

export modules=()

files=(./*)

for ((i = 0; i < ${#files[@]}; i++)); do
	dir=${files[i]}
	modules[i]="${dir#./*}"
done
