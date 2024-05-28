return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.basics').setup()
    require('mini.hues').setup({ background = '#2b1a33', foreground = '#c9c5cb' }) -- purple
    require('mini.files').setup()
    require('mini.comment').setup()
    require('mini.indentscope').setup()
    require('mini.statusline').setup()
    require('mini.starter').setup()
    require('mini.completion').setup()

    vim.keymap.set('n', '<leader>e', '<Cmd>lua MiniFiles.open()<CR>', { desc = 'Open MiniFiles' })
  end,
}
