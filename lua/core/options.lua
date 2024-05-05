local opt = vim.opt

-- 滑动
opt.scrolloff = 5

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 自动换行
opt.wrap = true

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")
opt.mousemoveevent = true

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

opt.autoread = true
opt.swapfile = false
opt.backup = false

opt.undofile = true
opt.undodir = vim.fn.expand(vim.fn.stdpath("data") .. "/undo")

vim.b.fileenconding = "utf-8"
