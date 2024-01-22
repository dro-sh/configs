return {
  -- ensure these language parsers are installed
  ensure_installed = {
    -- go stuff
    "gopls",
    "golangci-lint",
    "gofumpt",
    "goimports-reviser",
    "golines",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",

    -- yaml-development driven
    "yaml-language-server",
    "yamlfmt",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
}
