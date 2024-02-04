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
			graphql = { "prettierd" },
		},

		format_on_save = {
			pattern = ".lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs",
			timeout_ms = 500,
			async = false,
			lsp_fallback = true,
		},
	})
end

return M
