vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 全选
keymap.set("n", "vae", "ggVG")
-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 复制粘贴
keymap.set("v", "<C-Insert>", "y")
keymap.set({ "n", "i" }, "<S-Insert>", "p")

--  保存
keymap.set({ "n", "i" }, "<C-s>", "<Esc>:w<cr>")

-- 选择窗口
keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-N><C-w>h", { noremap = true })
keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-N><C-w>j", { noremap = true })
keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-N><C-w>k", { noremap = true })
keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-N><C-w>l", { noremap = true })
keymap.set("n", "<A-h>", "<C-w>h", { noremap = true })
keymap.set("n", "<A-j>", "<C-w>j", { noremap = true })
keymap.set("n", "<A-k>", "<C-w>k", { noremap = true })
keymap.set("n", "<A-l>", "<C-w>l", { noremap = true })

-- 更改窗口大小
keymap.set({ "t", "i", "n" }, "<C-Right>", "<C-w>>", { noremap = true })
keymap.set({ "t", "i", "n" }, "<C-Left>", "<C-w><", { noremap = true })
keymap.set({ "t", "i", "n" }, "<C-Up>", "<C-w>+", { noremap = true })
keymap.set({ "t", "i", "n" }, "<C-Down>", "<C-w>-", { noremap = true })
