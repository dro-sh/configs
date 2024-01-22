local golangCompaniesNames = "gitlab.com/zhazhazha1,gitlab.axarea.ru/main"

require("conform").setup {
  lsp_fallback = true,

  formatters_by_ft = {
    go = { "gofumpt", "goimports-reviser", "golines" },

    lua = { "stylua" },

    javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },

    -- TODO think about helm chart
    yaml = { "yamlfmt" },

    sh = { "shfmt" },

    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },

  formatters = {
    ["goimports-reviser"] = {
      prepend_args = { "-company-prefixes", golangCompaniesNames },
    },
    golines = {
      prepend_args = { "-m", "120" },
    },
    yamlfmt = {
      -- do not delete empty lines
      prepend_args = { "-formatter", "retain_line_breaks=true" },
    },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
