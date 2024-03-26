local M = {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
}

function M.config()
	require("ufo").setup({
		provider_selector = function()
			return { "lsp", "indent" }
		end,
	})
	vim.o.foldcolumn = "1"
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true
	vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

	vim.keymap.set("n", "zR", require("ufo").openAllFolds)
	vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
end

return M
