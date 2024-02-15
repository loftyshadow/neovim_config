local M = {
	"olimorris/persisted.nvim",
	config = true,
	dependencies = {
		"ethanholz/nvim-lastplace",
	},
}

function M.config()
	vim.keymap.set("n", "<leader>Sf", ":Telescop persisted<cr>")
	vim.keymap.set("n", "<leader>Ss", ":SessionSave<cr>")
	vim.keymap.set("n", "<leader>Sd", ":SessionDelete<cr>")

	require("persisted").setup({
		autosave = false,
	})
	require("nvim-lastplace").setup({
		lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
		lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
		lastplace_open_folds = true,
	})
end

return M
