local M = {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"famiu/bufdelete.nvim",
	},
}

function M.config()
	vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<cr>")
	vim.keymap.set("n", "L", ":BufferLineCycleNext<cr>")
	vim.keymap.set("n", "H", ":BufferLineCyclePrev<cr>")
	vim.keymap.set("n", "<leader>bg", ":BufferLinePick<CR>")
	vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>")
	vim.keymap.set("n", "<leader>bp", ":BufferLineTogglePin<CR>")
	vim.keymap.set("n", "<leader>bd", ":Bdelete<CR>", { noremap = true, silent = true })
	require("bufferline").setup({
		options = {
			close_command = "Bdelete! %d",
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
					separator = true, -- use a "true" to enable the default, or set your own character
				},
			},
			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				style = "icon",
			},
			separator_style = "slant",
			max_name_length = 12,
			hover = {
				enabled = true,
				delay = 200,
				reveal = { "close" },
			},
		},
	})
end

return M
