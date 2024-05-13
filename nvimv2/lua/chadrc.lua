-- Overrides for NvChad default config
---@type ChadrcConfig
local M = {}

local commentHL = { fg = "#777777", bold = true, italic = true }

M.ui = {
  theme = "tomorrow_night",

  tabufline = {
    enabled = false,
  },

  hl_override = {
    -- Comment highlight
    Comment = commentHL,
    ["@comment"] = commentHL,

    -- Nvim
    -- NvimTreeGitDeleted = { fg = "" }, -- good default
    NvimTreeGitDirty = { fg = "#fffcbd" },
    -- NvimTreeGitIgnored = { fg = "yellow" }, -- good default
    -- NvimTreeGitMerge = { fg = "yellow" }, -- do not used
    NvimTreeGitNew = { fg = "#fffcbd" },
    NvimTreeGitRenamed = { fg = "#fffcbd" },
  },

  hl_add = {
    -- Only there staged HL could be changed
    NvimTreeGitStaged = { fg = "#cbffbd" },
  },

  statusline = {
    theme = "vscode_colored",
    separator_style = "arrow",
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
