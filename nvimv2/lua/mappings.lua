require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-h>", "<C-w>h", { desc = "left window" })
map("n", "<C-l>", "<C-w>l", { desc = "right window" })
map("n", "<C-j>", "<C-w>j", { desc = "down window" })
map("n", "<C-k>", "<C-w>k", { desc = "up window" })

-- map("n", )

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
