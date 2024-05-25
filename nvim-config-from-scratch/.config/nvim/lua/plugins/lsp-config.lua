return {
  { 
    'williamboman/mason.nvim',
    opts = true,
  },
  { 
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'lua_ls',
        'tsserver',
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'

      lspconfig.lua_ls.setup {}
      lspconfig.tsserver.setup {}

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    end,
  },
  -- null-ls staff
  {
    'nvimtools/none-ls.nvim',
    keys = {
      { '<Leader>lf', vim.lsp.buf.format, desc = 'Format buffer' },
    },
    opts = function()
      local null_ls = require 'null-ls'
      local formatting = null_ls.builtins.formatting

      local sources = {
        formatting.stylua,
        formatting.prettierd,
        -- formatting.eslint_d,
      }

      return {
        sources = sources,
      }
    end,
  },
  { 
    'jay-babu/mason-null-ls.nvim',
    opts = {
      ensure_installed = {
        'stylua',
        'prettierd',
        'eslint_d',
      },
    },
  },
}
