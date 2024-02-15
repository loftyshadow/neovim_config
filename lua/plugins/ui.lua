local M = {
	"shaunsingh/nord.nvim",
	dependencies = {
		{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}

function M.config()
	vim.cmd([[colorscheme nord]])
	require("ibl").setup()
end

return M
