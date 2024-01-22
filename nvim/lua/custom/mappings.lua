local M = {}

M.disabled = {
  n = {
    ["<leader>h"] = "", -- remove mapping to open new terminal
    ["<leader>v"] = "", -- remove mapping to open new terminal
    ["<leader>b"] = "", -- remove mapping to open new buffer
  },
}

M.general = {
  n = {
    -- switch between windows
    ["<Left>"] = { "<C-w>h", "Window left" },
    ["<Right>"] = { "<C-w>l", "Window right" },
    ["<Down>"] = { "<C-w>j", "Window down" },
    ["<Up>"] = { "<C-w>k", "Window up" },

    -- cycle through buffers
    ["<Tab>"] = { ":BufferLineCycleNext<CR>", "Goto next tab", { silent = true } },
    ["<S-Tab>"] = { ":BufferLineCyclePrev<CR>", "Goto prev tab", { silent = true } },

    -- Buffers and tabs keymapss
    ["<C-x>"] = { ":tabc<CR>", "Close current tab", { silent = true } },
    ["<C-b>"] = { ":bdelete<CR>", "Close current buffer", { silent = true } },

    ["<S-j>"] = { ":m .+1<CR>==", "Move current line lower", { silent = true } },
    ["<S-k>"] = { ":m .-2<CR>==", "Move current line upper", { silent = true } },
  },

  v = {
    ["<S-j>"] = { ":m >+1<CR>gv=gv", "Move selected lines lower", { silent = true } },
    ["<S-k>"] = { ":m >-2<CR>gv=gv", "Move selected lines upper", { silent = true } },
  },
}

M.nvimtree = {
  n = {
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>n"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.telescope = { plugin = false }
M.fzf = {
  plugin = true,

  n = {
    ["<C-t>"] = { "<cmd> FzfLua files <CR>", "Find files", { silent = true } },
    ["<S-t>"] = { "<cmd> FzfLua git_status <CR>", "Find git changed files", { silent = true } },
    -- keymap.set("n", "<C-t>", ":FzfLua files<CR>", { silent = true }) -- Open fuzzy search for files
    -- keymap.set("n", "<S-t>", ":FzfLua git_status<CR>", { silent = true }) -- Open fuzzy search for files
  },
}

M.gitsigns = {
  n = {
    ["<leader>hs"] = { ":Gitsigns stage_hunk<CR>", "Stage git hunk", { silent = true } },
    ["<leader>hS"] = { ":Gitsigns stage_buffer<CR>", "Stage git buffer", { silent = true } },
    ["<leader>hr"] = { ":Gitsigns reset_hunk<CR>", "Reset git hunk", { silent = true } },
    ["<leader>hR"] = { ":Gitsigns reset_buffer<CR>", "Reset git buffer", { silent = true } },
    ["<leader>hu"] = { ":Gitsigns undo_stage_hunk<CR>", "Unstage git hunk", { silent = true } },
    ["<leader>td"] = { ":Gitsigns toggle_deleted<CR>", "Toggle deleted", { silent = true } },
    ["<leader>bd"] = { ":Gitsigns diffthis<CR>", "Open diff", { silent = true } },
    ["<leader>cd"] = { "<C-w>h<C-w>c", "Close diff", { silent = true } },
  },
}

return M
