local M = {
	"neovim/nvim-lspconfig",
}

function M.config()
	local lspconfig = require("lspconfig")
	-- lua
	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})
	lspconfig.marksman.setup({})
end

return M
