-- Overrides for NvChad default config
local M = {}

local commentHL = { fg = "#777777", bold = true, italic = true }
local gitStagedNewHL = { fg = "#cdffbd" }

M.ui = {
  theme = "tomorrow_night",

  tabufline = {
    enabled = false,
  },

  hl_override = {
    Comment = commentHL,
    ["@comment"] = commentHL,

    -- Nvim
    -- NvimTreeGitDeleted = { fg = "" }, -- good default
    NvimTreeGitDirty = { fg = "#fffcbd" },
    -- NvimTreeGitIgnored = { fg = "yellow" }, -- good default
    -- NvimTreeGitMerge = { fg = "yellow" }, -- do not used
    NvimTreeGitNew = gitStagedNewHL,
    NvimTreeGitRenamed = { fg = "#fffcbd" },
  },

  hl_add = {
    NvimTreeGitStaged = gitStagedNewHL,
  },

  statusline = {
    theme = "vscode_colored",
    separator_style = "arrow",
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
