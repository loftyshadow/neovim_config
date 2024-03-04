local M = {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
}

function M.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
		},
		log_level = vim.log.levels.DEBUG,

		format_on_save = {
			pattern = ".lua,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs",
			timeout_ms = 5000,
			async = true,
			lsp_fallback = true,
		},
	})
end

return M
