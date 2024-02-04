local M = {
	"akinsho/toggleterm.nvim",
}

function M.config()
	require("toggleterm").setup({
		open_mapping = [[<leader>tt]],
		start_in_start = true,
		direction = "float",
		float_opts = {
			border = "curved",
			width = 130,
			height = 30,
		},
	})
end

return M
