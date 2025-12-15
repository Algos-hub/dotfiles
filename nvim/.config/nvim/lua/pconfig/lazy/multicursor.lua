return {
	"smoka7/multicursors.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvimtools/hydra.nvim",
	},
	opts = {},
	cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
	keys = {
		{
			mode = { "v", "n" },
			"<Leader>m",
			"<cmd>MCstart<cr>",
			desc = "Create a selection for selected text or word under the cursor",
		},
	},
	config = function()
		require("multicursors").setup({
			hint_config = false,
		})
		vim.api.nvim_set_hl(0, "MultiCursor", { link = "Visual" })
		vim.api.nvim_set_hl(0, "MultiCursorMain", { link = "Visual" })
	end,
}
