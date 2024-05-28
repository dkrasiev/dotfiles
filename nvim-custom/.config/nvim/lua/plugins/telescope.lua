return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local builtin = require('telescope.builtin') 

    vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<Leader><Leader>', builtin.find_files, { desc = 'Find files' })

    vim.keymap.set('n', '<Leader>fw', builtin.live_grep, { desc = 'Find words' })
    vim.keymap.set('n', '<Leader>/', builtin.live_grep, { desc = 'Find words' })
  end,
}
