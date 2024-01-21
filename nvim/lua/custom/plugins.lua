local masonOpts = require "custom.configs.mason"
local TSOpts = require "custom.configs.nvim-treesitter"
local nvimTreeOpts = require "custom.configs.nvim-tree"
-- local masonOpts = require("custom.configs.")

local plugins = {
  -- overrides NvChad section
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = masonOpts,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = TSOpts,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = nvimTreeOpts,
  },

  -- new plugins section
  -- Tabs plugin
  {
    "akinsho/bufferline.nvim",
    event = "VimEnter",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "custom.configs.bufferline"
    end,
  },

  -- Formatters executor
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- Open file at last place
  {
    "farmergreg/vim-lastplace",
    lazy = false,
  },
}

return plugins
