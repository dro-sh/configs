-- ======================================
-- General
-- ======================================

-- set leader key
vim.g.mapleader = ","

-- shortcut
local keymap = vim.keymap

-- Increment/decrement number under cursor
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Don"t jump througth the line (for wrapped word)
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

keymap.set("n", "x", '"_x') -- disable copy to register deleted char by x

keymap.set("n", "<leader>rh", ":nohl<CR>", { silent = true }) -- remove search highlights

keymap.set("n", "<leader>tc", ":tabclose<CR>") -- close current tab

keymap.set("n", "<Right>", "<C-w>l", { noremap = true })
keymap.set("n", "<Left>", "<C-w>h", { noremap = true })
keymap.set("n", "<Up>", "<C-w>k", { noremap = true })
keymap.set("n", "<Down>", "<C-w>j", { noremap = true })
-- keymap.set("", "<C-j>", "<C-w>j", {noremap = true})
-- keymap.set("", "<C-k>", "<C-w>k", {noremap = true})

-- Use j and k on expression (like dj)
keymap.set("o", "j", "j")
keymap.set("o", "k", "k")

keymap.set("n", "<S-j>", ":m .+1<CR>==") -- move current line upper
keymap.set("n", "<S-k>", ":m .-2<CR>==") -- move current line lower
keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv") -- move current selection upper
keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv") -- move current selection lower

-- change horizontal split width (!!! think about)
keymap.set("n", ">", "<C-w>>") -- decrease
keymap.set("n", "<", "<C-w><") -- increase
-- change horizontal split
-- keymap.set("n", "<up>", "<C-w>+")
-- keymap.set("n", "<down>", "<C-w>-")

keymap.set("v", "<C-c>", '"*y') -- copy to clipboard

-- ======================================
-- Plugins
-- ======================================

keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, noremap = true }) -- Open/close Tree
keymap.set("n", "<leader>n", ":NvimTreeFindFileToggle<CR>", { silent = true, noremap = true }) -- Open Tree for current file

keymap.set("n", "<C-t>", ":FzfLua files<CR>", { silent = true }) -- Open fuzzy search for files
keymap.set("n", "<S-t>", ":FzfLua git_status<CR>", { silent = true }) -- Open fuzzy search for files

-- switch between tabs
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>") -- next tab
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>") -- prev tab

-- for git works see nvim/after/plugins/gitsigns.rc.lua
