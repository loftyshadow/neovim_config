local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
  "ueovim/nvim-lspconfig"
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
		PATH = "skip", -- "skip" seems to cause the spawning error
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
	require("mason-lspconfig").setup()
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
end

return M
