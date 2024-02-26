local M = {
	"https://github.com/adelarsq/image_preview.nvim",
	event = "VeryLazy",
}

function M.config()
	require("image_preview").setup()
end

return M
