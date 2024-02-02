paru -S --needed \
  git \
  fish \
  fisher \
  kitty \
  nvim \
  lazygit \
  ripgrep \
  tmux \
  stow

# link dotfiles
stow .
  
# TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# AstroNvim
if [ ! -d "~/.config/nvim" ]; then
  mv ~/.config/nvim ~/.config/nvim.bak

  mv ~/.local/share/nvim ~/.local/share/nvim.bak
  mv ~/.local/state/nvim ~/.local/state/nvim.bak
  mv ~/.cache/nvim ~/.cache/nvim.bak

  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
fi

# fisher 
echo "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source" | fish
echo "fisher update" | fish 
echo "nvm install lts" | fish
