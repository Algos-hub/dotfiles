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
				Visual = { fg = "base", bg = "text", inherit = false },
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}
