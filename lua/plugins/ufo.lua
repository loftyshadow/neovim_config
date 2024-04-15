local M = {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	event = "BufRead",
	opts = {
		preview = {
			win_config = {
				border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
				winblend = 0,
				winhighlight = "Normal:LazyNormal",
			},
		},
	},
	keys = {
		{
			"zO",
			function()
				require("ufo").openAllFolds()
			end,
			desc = "Open all folds",
		},
		{
			"zC",
			function()
				require("ufo").closeAllFolds()
			end,
			desc = "Close all folds",
		},
		{
			"zZ",
			function()
				require("ufo").peekFoldedLinesUnderCursor()
			end,
			desc = "Peek folded lines under cursor",
		},
	},
}

function M.config()
	require("ufo").setup({
		provider_selector = function()
			return { "lsp", "indent" }
		end,
	})
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true
	vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
end

return M
