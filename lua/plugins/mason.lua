local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}

function M.config()
	require("mason-tool-installer").setup({
		ensure_installed = {
			"lua-language-server",
			"stylua",
			"prettierd",
		},
	})
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "marksman" },
	})
end

return M
