return {
  -- ensure these language parsers are installed
  ensure_installed = {
    -- go stuff
    -- "golangci-lint",
    "gopls",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
}
