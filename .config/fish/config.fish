if status is-interactive
    # Commands to run in interactive sessions can go here
end

# theme
# fish_config theme choose "Catppuccin Mocha"
fish_config theme choose "Rosé Pine"

# environment variables
set EDITOR nvim 
set VISUAL nvim 
set QT_QPA_PLATFORMTHEME qt5ct 

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# remove fish greeting message
set fish_greeting

# remove nvm message
nvm use lts > /dev/null
