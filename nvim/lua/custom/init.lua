-- General vim overrides

vim.g.mapleader = ","
vim.opt.scrolloff = 7 -- min lines to top/bottom on scrolling

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]
