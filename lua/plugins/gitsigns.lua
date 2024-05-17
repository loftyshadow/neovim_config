local M = {
	"lewis6991/gitsigns.nvim",
}

function M.config()
	require("gitsigns").setup({
		on_attach = function(bufnr)
			local function map(mode, lhs, rhs, opts)
				opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
				vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
			end

			-- Navigation
			map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
			map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

			-- Actions
			map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")
			map("v", "<leader>gr", ":Gitsigns reset_hunk<CR>")
			map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>")
		end,
	})
end

return M
