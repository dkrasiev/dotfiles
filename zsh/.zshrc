source "$HOME/.config/zsh/antigen.zsh"
source "$HOME/.config/zsh/antigen-plugins.zsh"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

source "$HOME/.config/zsh/dkrasiev.zsh"
