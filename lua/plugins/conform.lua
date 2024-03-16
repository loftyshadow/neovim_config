local M = {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
}

function M.config()
	require("conform").setup({
		formatters_by_ft = {
			["lua"] = { "stylua" },
			["javascript"] = { "prettier" },
			["javascriptreact"] = { "prettier" },
			["typescript"] = { "prettier" },
			["typescriptreact"] = { "prettier" },
			["vue"] = { "prettier" },
			["css"] = { "prettier" },
			["scss"] = { "prettier" },
			["less"] = { "prettier" },
			["html"] = { "prettier" },
			["json"] = { "prettier" },
			["jsonc"] = { "prettier" },
			["yaml"] = { "prettier" },
			-- ["markdown"] = { "prettier" },
			["markdown.mdx"] = { "prettier" },
			["graphql"] = { "prettier" },
			["handlebars"] = { "prettier" },
		},
		log_level = vim.log.levels.DEBUG,

		format_on_save = {
			pattern = "*.lua,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs,*.ts",
			timeout_ms = 5000,
			async = true,
			lsp_fallback = true,
		},
	})
end

return M
