vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- x do not yank
keymap.set("v", "x", "_x")

-- ---------- 正常模式 ---------- ---
-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

--  保存
keymap.set({ "n", "i" }, "<C-s>", "<Esc>:w<cr>")

keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- 选择窗口
keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-N><C-w>h", { noremap = true })
keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-N><C-w>j", { noremap = true })
keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-N><C-w>k", { noremap = true })
keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-N><C-w>l", { noremap = true })
keymap.set("n", "<A-h>", "<C-w>h", { noremap = true })
keymap.set("n", "<A-j>", "<C-w>j", { noremap = true })
keymap.set("n", "<A-k>", "<C-w>k", { noremap = true })
keymap.set("n", "<A-l>", "<C-w>l", { noremap = true })
