if status is-interactive
    # Commands to run in interactive sessions can go here
end

# theme
fish_config theme choose "Rosé Pine"

# environment variables
set -x EDITOR nvim 
set -x VISUAL nvim 
# set -x QT_QPA_PLATFORMTHEME qt5ct 

fish_add_path ~/.local/share/gem/ruby/3.0.0/bin

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# remove fish greeting message
set fish_greeting

# set nodejs lts version silent
nvm use lts > /dev/null

# zoxide
zoxide init fish | source
