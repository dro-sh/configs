vim.cmd("autocmd!")

local opt = vim.opt

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

vim.wo.number = true

-- my opts
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.smarttab = true
opt.list = true
opt.title = true

opt.hlsearch = true
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search

opt.wrap = true -- No Wrap lines

opt.clipboard:append({ "unnamedplus" })

opt.listchars = {
	tab = "  ",
	trail = "·",
	nbsp = "␣",
}
-- my not on external config
opt.relativenumber = true
opt.ruler = true

-- check what is it do
opt.autoindent = true
opt.smartindent = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.scrolloff = 10
opt.shell = "zsh"
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.inccommand = "split"
opt.breakindent = true
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

opt.iskeyword:append("-") -- consider string-string as whole word

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]])
