local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
}

M.keys = {
	{
		"s",
		mode = { "n", "x", "o" },
		function()
			require("flash").jump()
		end,
		desc = "Flash",
	},
	{
		"r",
		mode = "o",
		function()
			require("flash").remote()
		end,
		desc = "Remote Flash",
	},
}

function M.config() end

return M
