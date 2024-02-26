local M = {
	"akinsho/toggleterm.nvim",
}

function M.config()
	require("toggleterm").setup({
		size = 60,
		open_mapping = [[<leader>tt]],
		start_in_start = true,
		direction = "vertical",
		float_opts = {
			border = "curved",
			width = 130,
			height = 30,
		},
	})
end

return M
