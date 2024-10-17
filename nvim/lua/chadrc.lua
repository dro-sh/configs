-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Overrides for NvChad default config
---@type ChadrcConfig
local M = {}

local commentHL = { fg = "#777777", bold = true, italic = true }

M.base46 = {
  theme = "tomorrow_night",

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
}

M.ui = {
  tabufline = {
    enabled = false,
  },

  statusline = {
    theme = "vscode_colored",
    separator_style = "arrow",
  },
}

M.mason = {
  pkgs = {
    -- go stuff
    "gopls",
    "golangci-lint",
    "gofumpt",
    "gci",
    "golines",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "deno", -- requirements for md preview https://github.com/toppair/peek.nvim

    -- yaml stuff
    "yaml-language-server",
    "yamlfmt",
    "helm-ls",

    -- json stuff
    "json-lsp",
    "fixjson",

    -- markdown stuff
    "marksman",
    "mdformat",

    -- terraform stuff
    "terraform-ls",

    -- This LSP are depricated. Use buf in future as it will be supported
    -- https://github.com/bufbuild/buf-language-server
    -- protobuf stuff
    "buf-language-server",
    "buf",
  },
}

return M
