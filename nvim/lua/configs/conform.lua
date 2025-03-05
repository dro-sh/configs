-- local golangCompaniesNames = "gitlab.com/zhazhazha1,gitlab.axarea.ru/main"

require("conform").setup {
  lsp_fallback = true,

  formatters_by_ft = {
    go = { "gofumpt", "gci", "golines" },

    lua = { "stylua" },

    javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },

    yaml = { "yamlfmt" },

    sh = { "shfmt" },

    tf = { "terraform_fmt" },

    proto = { "buf" },

    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },

  formatters = {
    gci = {
      prepend_args = {
        "-s",
        "standard",
        "-s",
        "default",
        "-s",
        "prefix(gitlab.com/zhazhazha1,gitlab.axarea.ru/main,github.com/now-team)",
        "-s",
        "localmodule",
      },
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
