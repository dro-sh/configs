local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Default config for next servers
local servers = {
  "html",
  "cssls",
  "tsserver",
  -- "golangci_lint_ls",
  "gopls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- старый конфиг для gopls
-- -- иницализация gopls LSP для Go
-- -- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-install
-- lspconfig.gopls.setup({
-- 	on_attach = on_attach,
-- 	cmd = { "gopls", "serve" },
-- 	filetypes = { "go", "go.mod" },
-- 	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
-- 	settings = {
-- 		gopls = {
-- 			analyses = {
-- 				unusedparams = true,
-- 				shadow = true,
-- 			},
-- 			staticcheck = true,
-- 		},
-- 	},
-- })
