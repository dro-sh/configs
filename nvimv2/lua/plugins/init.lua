local masonOpts = require "configs.mason"
local TSOpts = require "configs.nvim-treesitter"
local nvimTreeOpts = require "configs.nvim-tree"

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
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
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
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
