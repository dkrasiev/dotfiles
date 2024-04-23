return {
  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.rose-pine" },
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.colorscheme.tokyonight-nvim" },
    { import = "astrocommunity.colorscheme.dracula-nvim" },
    { import = "astrocommunity.colorscheme.nord-nvim" },
    { import = "astrocommunity.colorscheme.nordic-nvim" },
    { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  },

  {
    "rose-pine",
    opts = {
      disable_background = true,
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      -- needs because of a rose-pine with disabled background
      background_colour = "#000000",
    },
  },
}
