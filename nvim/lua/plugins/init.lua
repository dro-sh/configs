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
      require "configs.bufferline"
    end,
  },

  -- Formatters executor
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- Linters executor
  {
    "mfussenegger/nvim-lint",
    event = { "BufEnter", "BufWritePre", "InsertLeave" },
    config = function()
      require "configs.nvim-lint"
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
  },

  -- helm charts
  { "towolf/vim-helm", ft = "helm" },

  -- markdown preview
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  -- using LLM for coding
  {
    -- fork from source while this PR is not merged https://github.com/Exafunction/codeium.nvim/pull/241
    "dimfeld/codeium.nvim",
    branch = "virtual-text",
    event = "BufEnter",
    cmd = "Codeium",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {
        enable_chat = true, -- does not work  https://github.com/Exafunction/codeium.nvim/pull/243
        virtual_text = {
          enabled = true,
          key_bindings = {
            accept = "<M-Tab>",
          },
        },
      }
    end,
  },

  -- load luasnips + cmp related in insert mode only
  -- copied from https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/plugins/init.lua
  -- waiting answer to question https://github.com/NvChad/NvChad/discussions/3033
  -- to customize config on nvim cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, { name = "codeium" })
    end,
  },
}
