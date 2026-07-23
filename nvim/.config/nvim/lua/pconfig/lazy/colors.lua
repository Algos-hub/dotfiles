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
			highlight_groups = {
				Colorcolumn = { bg = "#444444" },
				Visual = { fg = "base", bg = "#949494", inherit = false },
				Cursorline = { bg = "#444444" },
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}
