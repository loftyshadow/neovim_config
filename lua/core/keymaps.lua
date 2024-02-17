vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "<A-a>", "<ESC>A")
keymap.set("i", "<A-o>", "<ESC>o")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- x do not yank
keymap.set("v", "x", "_x")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
keymap.set("n", "<leader>wc", "<C-w>c") -- 关闭当前窗口
keymap.set("n", "J", "5j")
keymap.set("n", "K", "5k")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

--  保存
keymap.set({ "n", "i" }, "<C-s>", "<Esc>:w<cr>")
-- select all
keymap.set("n", "<C-a>", "ggVG")
-- <leader>quit
keymap.set("n", "<leader>q", ":q<cr>")
