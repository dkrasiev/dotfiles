return {
  "folke/zen-mode.nvim",
  keys = {
    { '<Leader>zz', function() require('zen-mode').toggle() end, desc = 'Toggle zen mode' },
  },
  opts = {
    window = {
      options = {
        number = true,
        relativenumber = true,
      },
    },
    plugins = {
      -- tmux = { enabled = true },
      kitty = {
        enabled = true,
        font = "+2",
      },
    },
  },
}
