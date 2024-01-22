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

  -- Linters executor
  {
    "mfussenegger/nvim-lint",
    event = { "BufEnter", "BufWritePre", "InsertLeave" },
    config = function()
      require "custom.configs.nvim-lint"
    end,
    init = function()
      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePre" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  -- Open file at last place
  { "farmergreg/vim-lastplace", lazy = false },

  -- fzf beauty file finder
  { "nvim-telescope/telescope.nvim", enabled = false }, -- remove telescope
  { "junegunn/fzf", build = "./install --all" },
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    config = function()
      require("fzf-lua").setup {}
    end,
    init = function()
      require("core.utils").load_mappings "fzf"
    end,
  },
}

return plugins
