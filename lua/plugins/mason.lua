local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
		"folke/neodev.nvim",
		"j-hui/fidget.nvim",
		"nvimdev/lspsaga.nvim",
		"RRethy/vim-illuminate",
		{
			"zeioth/garbage-day.nvim",
			dependencies = "neovim/nvim-lspconfig",
			event = "VeryLazy",
			opts = {},
		},
	},
}

function M.config()
	local servers = {
		lua_ls = {
			settings = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		},
		marksman = {},
		tsserver = {},
		pyright = {},
		volar = {},
	}
	local on_attach = function(_, bufnr)
		local diagnostic_goto = function(next, severity)
			local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
			severity = severity and vim.diagnostic.severity[severity] or nil
			return function()
				go({ severity = severity })
			end
		end
		local nmap = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end

			vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
		end

		nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		nmap("gh", ":Lspsaga hover_doc<cr>", "Hover Documentation")
		nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
		nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
		nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
		nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
		nmap("<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, "[W]orkspace [L]ist Folders")
		nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
		nmap("<leader>da", require("telescope.builtin").diagnostics, "[D]i[A]gnostics")
		vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
		vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
		vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
		vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
		vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
		vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
		vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
		nmap("<leader>rn", ":Lspsaga rename<cr>", "[R]e[n]ame ctrl + K to exit")
		nmap("<leader>ol", ":Lspsaga outline<cr>", "[O]out[L]ine")
		nmap("<leader>ca", ":Lspsaga code_action<cr>", "[C]ode [A]ction")
		nmap("<leader>fa", ":Lspsaga finder<cr>", "By default it shows results for references and implementation.")
		nmap("<space>ft", function()
			vim.lsp.buf.format({ async = true })
		end, "[F]ormat code")
	end
	require("neodev").setup({})
	require("illuminate").configure({})
	require("fidget").setup({})
	require("lspsaga").setup({})
	require("mason-tool-installer").setup({
		ensure_installed = {
			"lua-language-server",
			"stylua",
			"prettier",
			"typescript-language-server",
			"pyright",
			"vue-language-server",
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
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("mason-lspconfig").setup({
		ensure_installed = vim.tbl_keys(servers),
	})

	for server, config in pairs(servers) do
		require("lspconfig")[server].setup(vim.tbl_deep_extend("keep", {
			on_attach = on_attach,
			capabilities = capabilities,
		}, config))
	end
end

return M
