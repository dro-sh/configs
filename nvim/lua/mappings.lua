require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<Left>", "<C-w>h", { desc = "left window" })
map("n", "<Right>", "<C-w>l", { desc = "right window" })
map("n", "<Down>", "<C-w>j", { desc = "down window" })
map("n", "<Up>", "<C-w>k", { desc = "up window" })
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Goto next tab" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Goto prev tab" })

map("n", "<C-x>", ":tabc<CR>", { desc = "Close current tab" })
map("n", "<C-b>", ":bdelete<CR>", { desc = "Close current buffer" })

-- TODO it does not work
map("n", "<S-j>", ":m .+1<CR>==", { desc = "Move current line lower", silent = true })
-- map("n", "<S-k>", ":m .-2<CR>==", { desc = "Move current line upper", silent = true })
map("v", "<S-j>", ":m >+1<CR>gv=gv", { desc = "Move selected lines lower", silent = true })
map("v", "<C-k>", ":m >-2<CR>gv=gv", { desc = "Move selected lines upper", silent = true })

-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree", silent = true })
map("n", "<leader>n", "<cmd> NvimTreeFocus <CR>", { desc = "Focus nvimtree", silent = true })

-- gitsigns
map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage git hunk", silent = true })
map("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", { desc = "Stage git buffer", silent = true })
map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset git hunk", silent = true })
map("n", "<leader>hR", ":Gitsigns reset_buffer<CR>", { desc = "Stage git buffer", silent = true })
map("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Unstage git hunk", silent = true })
map("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted", silent = true })
map("n", "<leader>bd", ":Gitsigns diffthis<CR>", { desc = "Open diff", silent = true })
map("n", "<leader>cd", "<C-w>h<C-w>c", { desc = "Close diff", silent = true })

-- fzf
map("n", "<C-t>", "<cmd> FzfLua files <CR>", { desc = "Find files", silent = true })
map("n", "<S-t>", "<cmd> FzfLua git_status <CR>", { desc = "Find git changed files", silent = true })
