-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Escape" })
map("i", "jj", "<Esc>", { desc = "Escape" })

-- Obsidian Mappings
map("n", "<leader>on", ":ObsidianTemplate new_note<cr>", { desc = "Insert New Note Template" })
map("n", "<leader>os", ":ObsidianSearch<cr>", { desc = "Search Vault (Telescope)" })
map("n", "<leader>ot", ":ObsidianTags<cr>", { desc = "Search Tags" })
map("n", "<leader>ol", ":ObsidianLinks<cr>", { desc = "Show Links in Note" })
