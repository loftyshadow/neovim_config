local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	dependencies = {
		{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
		"petertriho/nvim-scrollbar",
		{
			"lukas-reineke/headlines.nvim",
			dependencies = "nvim-treesitter/nvim-treesitter",
			config = true, -- or `opts = {}`
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
	},
}

function M.config()
	vim.cmd([[colorscheme catppuccin-frappe]])
	require("lualine").setup({
		options = {
			theme = "catppuccin",
			-- ... the rest of your lualine config
		},
	})
	local highlight = {
		"RainbowRed",
		"RainbowYellow",
		"RainbowBlue",
		"RainbowOrange",
		"RainbowGreen",
		"RainbowViolet",
		"RainbowCyan",
	}

	local hooks = require("ibl.hooks")
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	end)

	require("ibl").setup({ indent = { highlight = highlight } })
	require("scrollbar").setup()
	require("headlines").setup({
		markdown = {
			headline_highlights = {
				"Headline1",
				"Headline2",
				"Headline3",
				"Headline4",
				"Headline5",
				"Headline6",
			},
			codeblock_highlight = "CodeBlock",
			dash_highlight = "Dash",
			quote_highlight = "Quote",
		},
	})
end

return M
