-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<esc>")
map("i", "jk", "<esc>")
map("n", ";", ":")

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
-- map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit window" })
-- map("n", "<leader>Q", "<cmd>confirm qall<cr>", { desc = "Exit" })

map("n", "<leader>c", LazyVim.ui.bufremove, { desc = "Close buffer" })

map({ "n", "v" }, "<leader>lf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

map("n", "<leader>h", "<cmd>Dashboard<cr>", { desc = "Open dashboard" })

map("n", "<leader>zz", require('zen-mode').toggle, { desc = "Toggle zen mode" })
