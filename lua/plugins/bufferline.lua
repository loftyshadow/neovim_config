local M = {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
}

function M.config()
	vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<cr>")
	vim.keymap.set("n", "]b", ":BufferLineCycleNext<cr>")
	vim.keymap.set("n", "[b", ":BufferLineCyclePrev<cr>")
	vim.keymap.set("n", "<leader>bg", ":BufferLinePick<CR>")
	require("bufferline").setup({
		options = {
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
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
