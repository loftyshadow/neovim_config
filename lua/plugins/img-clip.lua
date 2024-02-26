local M = {
	"HakonHarnes/img-clip.nvim",
	cmd = {
		"PasteImage",
	},
	keys = {
		{
			"<leader>p",
			function()
				vim.api.nvim_command("PasteImage")
			end,
			desc = "Paste clipboard image",
		},
	},
	opts = {
		default = {
			dir_path = function()
				return "img" -- .. vim.fn.expand("%:t:r")
			end,
			file_name = "%Y-%m-%d-%H-%M-%S", -- file name format (see lua.org/pil/22.1.html)
			relative_to_current_file = true, -- make dir_path relative to current file rather than the cwd
			prompt_for_file_name = false, -- ask user for file name before saving, leave empty to use default
			insert_mode_after_paste = false, -- enter insert mode after pasting the markup code
		},
	},
}

return M
