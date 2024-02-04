local M = {
	"olimorris/persisted.nvim",
	config = true,
}

function M.config()
	vim.keymap.set("n", "<leader>Sf", ":Telescop persisted<cr>")
	vim.keymap.set("n", "<leader>Ss", ":SessionSave<cr>")
	vim.keymap.set("n", "<leader>Sd", ":SessionDelete<cr>")

	require("persisted").setup()
end

return M
