local M = {}

M.disabled = {
  n = {
    ["<leader>h"] = "", -- remove mapping to open new terminal
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
    ["<Tab>"] = { ":BufferLineCycleNext<CR>", "Goto next buffer", { silent = true } },
    ["<S-Tab>"] = { ":BufferLineCyclePrev<CR>", "Goto prev buffer", { silent = true } },

    -- Buffers and tabs keymapss
    ["<C-x>"] = { ":tabc<CR>", "Close current tab", { silent = true } },
    ["<C-b>"] = { ":bdelete<CR>", "Close current buffer", { silent = true } },
  },
}

M.telescope = {
  n = {
    ["<C-t>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>hs"] = { ":Gitsigns stage_hunk<CR>", "Stage git hunk" },
    ["<leader>hS"] = { ":Gitsigns stage_buffer<CR>", "Stage git buffer" },
    ["<leader>hr"] = { ":Gitsigns reset_hunk<CR>", "Unstage git hunk" },
    ["<leader>hR"] = { ":Gitsigns reset_buffer<CR>", "Reset git buffer" },
    ["<leader>hu"] = { ":Gitsigns undo_stage_hunk<CR>", "Unstage git hunk" },
  },
}

return M
