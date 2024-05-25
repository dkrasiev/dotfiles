return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.basics').setup()
    require('mini.hues').setup({})
  end,
}
