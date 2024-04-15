local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
    -- stylua: ignore
    local colors = {
        blue   = '#80a0ff',
        cyan   = '#79dac8',
        black  = '#080808',
        white  = '#c6c6c6',
        red    = '#ff5189',
        violet = '#d183e8',
        grey   = '#303030',
    }

	local bubbles_theme = {
		normal = {
			a = { fg = colors.black, bg = colors.violet },
			b = { fg = colors.white, bg = colors.grey },
			c = { fg = colors.white },
		},

		insert = { a = { fg = colors.black, bg = colors.blue } },
		visual = { a = { fg = colors.black, bg = colors.cyan } },
		replace = { a = { fg = colors.black, bg = colors.red } },

		inactive = {
			a = { fg = colors.white, bg = colors.black },
			b = { fg = colors.white, bg = colors.black },
			c = { fg = colors.white },
		},
	}
	local rec_msg = ""
	vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
		group = vim.api.nvim_create_augroup("LualineRecordingSection", { clear = true }),
		callback = function(e)
			if e.event == "RecordingLeave" then
				rec_msg = ""
			else
				rec_msg = "recording @" .. vim.fn.reg_recording()
			end
		end,
	})
	local config = {
		-- Inserts a component in lualine_c at left section
		options = {
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			diagnostics = "nvim_lsp",
			always_divide_middle = true,
			globalstatus = true,
			theme = bubbles_theme,
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
			-- 左边
			lualine_b = {
				-- 文件名
				"filename",
				-- 分支
				"branch",
				-- 录制展示
				{
					function()
						return rec_msg
					end,
					color = { fg = "#ff9e64" },
				},
			},
			lualine_c = {
				{
					"diff",
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
					separator = { left = " " },
				},
				"%=", --[[ 分割后面是中间 ]]
			},
			-- 最右前
			lualine_x = {
				{
					"diagnostics",
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = "",
					},
				},
				-- 时间
				{
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			-- 最右
			lualine_y = {
				-- 文件类型
				"filetype",
				-- 进度
				"progress",
			},
			lualine_z = {
				{ "location", separator = { right = "" }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = {},
	}

	require("lualine").setup(config)
end

return M
