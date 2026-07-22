return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "moon",
			dark_variant = "moon",
			styles = {
				transparency = true,
			},
			pallette = {
				moor = {
					border = "#949494",
					link = "iris",
					panel = "#2d2d2d",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},
			},
			highlight_groups = {
				Visual = { fg = "base", bg = "#949494", inherit = false },
				Cursorline = { fg = "inherit", bg = "#444444", inherit = false },
				Colorcolumn = { fg = "inherit", bg = "#444444", inherit = false },
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}
