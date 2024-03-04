local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"axelvc/template-string.nvim",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
	},
}

function M.config()
	require("nvim-treesitter.configs").setup({
		textobjects = {
			select = {
				enable = true,
			},
		},
		ensure_installed = {
			"tsx",
			"lua",
			"vim",
			"typescript",
			"javascript",
			"html",
			"css",
			"json",
			"regex",
			"rust",
			"prisma",
			"markdown",
			"markdown_inline",
		},

		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},

		sync_install = false,

		auto_install = true,

		highlight = {
			enable = true,

			additional_vim_regex_highlighting = false,
		},
		autotag = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<enter>",
				node_incremental = "<enter>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	})
	require("template-string").setup({})
	require("treesitter-context").setup({})
end

return M
