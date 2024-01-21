require("conform").setup({
	lsp_fallback = true,

	formatters_by_ft = {
    go = {"goimports", "gofmt"},

		lua = { "stylua" },

		javascript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },

		sh = { "shfmt" },

    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
	},

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

	format_on_save = {
	  -- These options will be passed to conform.format()
	  timeout_ms = 500,
	  lsp_fallback = true,
	},
})
