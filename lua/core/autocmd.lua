-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- 关闭新行注释：
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})

-- 退出插入模式切换输入法
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	pattern = { "*" },
	callback = function()
		local input_status = tonumber(vim.fn.system("im-select.exe"))
		if input_status == 2052 then
			vim.fn.system("im-select.exe 1033")
		end
	end,
})

-- feline 主题修改
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		package.loaded["feline"] = nil
		package.loaded["catppuccin.groups.integrations.feline"] = nil
		require("feline").setup({
			components = require("catppuccin.groups.integrations.feline").get(),
		})
	end,
})
