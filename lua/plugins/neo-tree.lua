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
	require("neo-tree").setup({
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.cmd([[setlocal relativenumber]])
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
				["[c"] = "prev_git_modified",
				["]c"] = "next_git_modified",
			},
		},
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
			find_by_full_path_words = false,
			window = {
				mappings = {
					["<leader>p"] = "image_wezterm", -- " or another map
				},
			},
			commands = {
				image_wezterm = function(state)
					local node = state.tree:get_node()
					if node.type == "file" then
						require("image_preview").PreviewImage(node.path)
					end
				end,
			},
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
