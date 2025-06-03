-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<Esc>")
map("i", "jk", "<Esc>")
map("n", ";", ":")

map("n", "<Leader>w", "<Cmd>w<CR>", { desc = "Write" })

-- map("n", "<Leader>q", "<cmd>confirm q<cr>", { desc = "Quit window" })
-- map("n", "<Leader>Q", "<cmd>confirm qall<cr>", { desc = "Exit" })

-- map({ "n", "v" }, "<Leader>lf", function()
--   LazyVim.format({ force = true })
-- end, { desc = "Format" })

-- map("n", "<Leader>h", "<Cmd>Dashboard<CR>", { desc = "Open dashboard" })
