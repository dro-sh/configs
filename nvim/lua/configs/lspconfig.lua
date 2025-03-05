-- load defaults i.e lua_lsp
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

local lspconfig = require "lspconfig"
-- List of supported servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- Default config for next servers
local servers = {
  "html",
  "cssls",
  "ts_ls",
  "yamlls",
  "jsonls",
  "helm_ls",
  "terraformls",
  "marksman",
  "buf_ls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
}

lspconfig.helm_ls.setup {
  settings = {
    ["helm-ls"] = {
      yamlls = {
        path = "yaml-language-server",
      },
    },
  },
}
