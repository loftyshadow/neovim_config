local M = {
	"tversteeg/registers.nvim",
	cmd = "Registers",
	config = true,
	keys = {
		{ '"', mode = { "n", "v" } },
		{ "<C-R>", mode = "i" },
	},
	name = "registers",
}

M.config = function()
	require("registers").setup({})
end

return M
