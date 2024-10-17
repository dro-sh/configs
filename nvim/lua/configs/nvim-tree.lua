return {
  git = {
    enable = true,
  },
  filters = {
    custom = { ".git" },
  },
  renderer = {
    icons = {
      git_placement = "after",
      show = {
        folder_arrow = false,
        git = true,
      },
      glyphs = {
        git = {
          unstaged = "",
          untracked = "",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
}
