return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},

		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>bb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fd", function()
				builtin.diagnostics({ bufnr = 0 })
			end, {})
			vim.keymap.set("n", "<leader>fb", function()
				require("telescope").extensions.file_browser.file_browser()
			end)
			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = "none" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = true,
						-- initial_mode = "normal",
					},
					buffers = {
						initial_mode = "normal",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					file_browser = {
						initial_mode = "normal",
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("file_browser")
		end,
	},
}
