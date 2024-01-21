-- Overrides for NvChad default config
local M = {}

M.ui = {
  theme = "vscode_dark",

  tabufline = {
    enabled = false,
  },

  hl_override = {
    Comment = { italic = true, bold = true, fg = "#bbbbbb" },
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
