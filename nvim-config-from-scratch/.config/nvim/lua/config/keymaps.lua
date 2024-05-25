local set = vim.keymap.set

set('i', 'jj', '<Esc>')
set('i', 'jk', '<Esc>')

set('n', 'H', '^')
set('n', 'L', '$')

set('n', '<Leader>s', ':w<CR>', { desc = 'Save file' })
set('n', '<leader>q', '<C-w>q', { desc = 'Quit' })

set('n', ';', ':')

set('n', '\\', '<C-w>v')
set('n', '|', '<C-w>h')

set('n', '<C-h>', '<C-w>h')
set('n', '<C-j>', '<C-w>j')
set('n', '<C-k>', '<C-w>k')
set('n', '<C-l>', '<C-w>l')

set('n', '<Leader>pl', '<Cmd>Lazy<CR>', { desc = 'Open Lazy' })
set('n', '<Leader>pm', '<Cmd>Mason<CR>', { desc = 'Open Mason' })

