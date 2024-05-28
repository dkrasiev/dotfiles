return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wh = require 'which-key'
    wh.register(
      {
        l = {
          name = 'LSP',
        },
        p = {
          name = 'Programs',
        },
        f = {
          name = 'Find',
        },
      },
      { prefix = '<Leader>' }
    )
  end,
}
