return {
  -- ensure these language parsers are installed
  ensure_installed = {
    -- go stuff
    "go",
    "gomod",

    -- sql stuff
    "sql",

    -- devops stuff
    "dockerfile",

    -- markup stuff
    "yaml",
    "markdown",
    "markdown_inline",
    "json",
    "helm",
    "terraform",

    -- git stuff
    "gitignore",

    -- lua stuff
    "lua",

    -- vim stuff
    "vim",

    -- terraform stuff
    "terraform",

    -- bluvota stuff
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
  },
  -- enable indentation
  indent = {
    enable = true,
  },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
}
