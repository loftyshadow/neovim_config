local M = {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
}

function M.config()
	local surround = require("nvim-surround")
	surround.setup({})
end

return M
