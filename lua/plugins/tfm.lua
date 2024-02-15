local M = {
	"rolv-apneseth/tfm.nvim",
}

function M.config()
	-- Set keymap so you can open the default terminal file manager (yazi)
	vim.api.nvim_set_keymap("n", "<leader>yz", "", {
		noremap = true,
		callback = require("tfm").open,
	})
end

return M
