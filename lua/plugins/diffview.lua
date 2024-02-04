local M = {
	"sindrets/diffview.nvim",
}

function M.config()
	vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory %<cr>")
	vim.keymap.set("n", "<leader>gb", ":DiffviewFileHistory<cr>")
end

return M
