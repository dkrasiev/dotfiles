if status is-interactive
    # Commands to run in interactive sessions can go here
end

# theme
# fish_config theme choose "Catppuccin Mocha"
fish_config theme choose "Rosé Pine"

# environment variables
set -x EDITOR nvim
set -x VISUAL nvim

alias gl='git log --oneline --graph'
alias v='nvim'

# remove fish greeting message
set fish_greeting

# remove nvm message
nvm use lts >/dev/null

# bun
set -x BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin $PATH
# set -x PATH $BUN_INSTALL/bin $PATH

fish_add_path ~/.local/share/gem/ruby/3.0.0/gems/tmuxinator-3.0.5/bin

if type -q zoxide
    zoxide init fish | source
end
