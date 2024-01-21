return {
  git = {
    enable = true,
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
					deleted = "",
				},
			},
		},

    highlight_git = true,
  },
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
}
