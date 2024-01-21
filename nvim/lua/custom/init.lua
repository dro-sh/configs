-- General vim overrides

-- see :help nvim-tree-netrw
-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- map leader key
vim.g.mapleader = ","

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]
