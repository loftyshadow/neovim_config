local M = {
	"akinsho/toggleterm.nvim",
}

function M.config()
	local Terminal = require("toggleterm.terminal").Terminal
	-- npm run docs:dev
	local docs = Terminal:new({ cmd = "npm run docs:dev", hidden = true, direction = "vertical" })
	function _docs()
		docs:toggle()
	end
	vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>lua _docs()<CR>", { noremap = true, silent = true })
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
