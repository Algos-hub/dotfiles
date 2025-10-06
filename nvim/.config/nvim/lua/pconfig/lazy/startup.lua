return {
	"startup-nvim/startup.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("startup").setup({
			theme = "evil",
		})
		vim.cmd("setlocal nospell")
	end,
}
