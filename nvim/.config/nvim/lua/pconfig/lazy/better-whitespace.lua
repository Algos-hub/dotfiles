return {
	"ntpeters/vim-better-whitespace",
	config = function()
		vim.cmd("EnableWhitespace")
		vim.cmd("highlight ExtraWhitespace guibg='#eb6f92'")
	end,
}
