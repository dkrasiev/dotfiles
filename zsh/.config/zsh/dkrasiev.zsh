# Aliases
alias v='nvim'
alias lg='lazygit'
alias c='clear'

# Variables
export EDITOR='nvim'
export VISUAL='nvim'

# functions
nshell() {
  case "$#" in
  "0") ;;
  "1")
    nix develop "/etc/nixos#$1" -c zsh
    ;;
  "2")
    nix develop "/etc/nixos#$1" -c zsh -c "$2"
    ;;
  esac
}

reload() {
  case $1 in
  kitty)
    kill -sigusr1 "$(pidof kitty)"
    ;;
  zsh)
    source "$HOME/.zshrc"
    ;;
  tmux)
    tmux source ~/.config/tmux/tmux.conf
    ;;
  esac
}
