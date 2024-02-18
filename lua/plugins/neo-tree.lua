local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
}

function M.config()
	vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
	--Open neo-tree at current file or working directory
	vim.keymap.set("n", "<leader>o", function()
		local reveal_file = vim.fn.expand("%:p")
		if reveal_file == "" then
			reveal_file = vim.fn.getcwd()
		else
			local f = io.open(reveal_file, "r")
			if f then
				f.close(f)
			else
				reveal_file = vim.fn.getcwd()
			end
		end
		require("neo-tree.command").execute({
			position = "left", -- OPTIONAL, this is the default value
			reveal_file = reveal_file, -- path to file or folder to reveal
			reveal_force_cwd = true, -- change cwd without asking if needed
		})
	end)

	require("neo-tree").setup({
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function(arg)
					vim.cmd([[
              setlocal relativenumber
            ]])
				end,
			},
		},
		window = {
			width = "25%",
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
				["[s"] = "prev_source",
				["]s"] = "next_source",
			},
		},
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
			find_by_full_path_words = false,
		},
		source_selector = {
			winbar = true, -- toggle to show selector on winbar
			sources = { -- table
				{
					source = "filesystem", -- string
					display_name = " 󰉓 Files ", -- string | nil
				},
				{
					source = "git_status", -- string
					display_name = " 󰊢 Git ", -- string | nil
				},
			},
		},
	})
	vim.api.nvim_create_autocmd("TermClose", {
		pattern = "*lazygit",
		callback = function()
			if package.loaded["neo-tree.sources.git_status"] then
				require("neo-tree.sources.git_status").refresh()
			end
		end,
	})
end

return M
