-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- See @ https://github.com/nvim-tree/nvim-tree.lua#setup
-- recommended settings from nvim-tree documentation.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
	-- change folder arrow icons
	renderer = {
		indent_markers = {
			enable = true,
		},
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
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
})
