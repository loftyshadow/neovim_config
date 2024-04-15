local M = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
}

function M.config()
	local builtin = require("telescope.builtin")
	local keymap = vim.keymap
	keymap.set("n", "<leader>ff", builtin.find_files, {})
	keymap.set("n", "<leader>fw", builtin.live_grep, {})
	keymap.set("n", "<leader>fb", builtin.buffers, {})
	keymap.set("n", "<leader>fh", builtin.help_tags, {})
	keymap.set("n", "<leader>rc", builtin.oldfiles, {})
	keymap.set("n", "<leader>fm", builtin.marks, {})

	local actions = require("telescope.actions")
	require("telescope").setup({
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
		defaults = {
			mappings = {
				i = {
					["esc"] = actions.close,
				},
			},
			file_ignore_patterns = {
				"codegen.ts",
				".git",
				"lazy-lock.json",
				"*-lock.yaml",
				"node_modules",
				"%.lock",
			},
			dynamic_preview_title = true,
			path_display = { "smart" },
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
		layout_config = {
			horizontal = {
				preview_cutoff = 100,
				preview_width = 0.5,
			},
		},
	})
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("persisted")
end

return M
