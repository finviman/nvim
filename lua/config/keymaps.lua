-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- lua/config/keymaps.lua
-- 注意：LazyVim 默认 mapleader 就是空格，因此无需重复绑定空格为 Nop

local map = vim.keymap.set

-- 禁用 Emmet 默认 Leader（保留你的配置）
vim.g.user_emmet_leader_key = "<C-g>"
-- 1. 先抹掉 LazyVim 的默认逗号行为
vim.keymap.del({ "n", "x", "o" }, ",")

-------------------------------------------------------------------------------
-- 1. 命令行 (Command Mode) Emacs 风格快捷键
-------------------------------------------------------------------------------
map("c", "<C-A>", "<Home>", { desc = "Line Start" })
map("c", "<C-E>", "<End>", { desc = "Line End" })
map("c", "<C-j>", "<Down>", { desc = "History Down" })
map("c", "<C-k>", "<Up>", { desc = "History Up" })

-------------------------------------------------------------------------------
-- 2. 插入模式 (Insert Mode) Emacs 风格快捷键与操作
-------------------------------------------------------------------------------
map("i", "<C-a>", "<Home>")
map("i", "<C-e>", "<End>")
map("i", "<C-f>", "<Right>")
map("i", "<C-b>", "<Left>")
map("i", "<C-n>", "<Down>")
map("i", "<C-p>", "<Up>")
map("i", "<C-d>", "<Del>")
map("i", "<C-h>", "<Backspace>")
map("i", "<C-k>", "<Esc>lC", { desc = "Kill Line" })
map("i", "<C-s>", "<Esc>:w<cr>a", { desc = "Save in insert" })

-------------------------------------------------------------------------------
-- 3. 普通模式 (Normal Mode) 体验增强
-------------------------------------------------------------------------------
-- 清空搜索高亮 & 清理 Noice 弹窗
map("n", "<Esc>", ":nohlsearch | Noice dismiss<cr>", { silent = true, desc = "Clear hl and Noice" })

-- 空行插入
map("n", "<M-[>", ":put =repeat(nr2char(10), v:count1)<cr>", { desc = "Insert Line Below" })
map("n", "<M-]>", ":put! =repeat(nr2char(10), v:count1)<cr>", { desc = "Insert Line Above" })

-- 移动光标（按屏幕折行移动）
map("n", "k", "gk")
map("n", "j", "gj")

-- 复制与搜索居中
map("n", "Y", "y$")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- 快速上下移动行 (Alt/Cmd + j/k)
map("n", "<M-j>", "mz:m+<cr>`z")
map("n", "<M-k>", "mz:m-2<cr>`z")
map("v", "<M-j>", ":m '>+1<cr>gv=gv")
map("v", "<M-k>", ":m '<-2<cr>gv=gv")

map("n", "<D-j>", "mz:m+<cr>`z")
map("n", "<D-k>", "mz:m-2<cr>`z")
map("v", "<D-j>", ":m '>+1<cr>gv=gv")
map("v", "<D-k>", ":m '<-2<cr>gv=gv")

-- 系统剪贴板复制与删除
map({ "n", "x" }, ",y", '"+y', { desc = "Copy to system clipboard" })
map("n", ",w", ":w<CR>", { desc = "Save File" })
map("n", ",d", '"+yydd', { desc = "Cut line to system clipboard" })

-- 快速切到命令行
map("n", "<space><space>", "<S-:>", { desc = "Cmd Line" })

-------------------------------------------------------------------------------
-- 4. 窗口导航与终端
-------------------------------------------------------------------------------
map("", "<C-j>", "<C-W>j", { desc = "Go to window below" })
map("", "<C-k>", "<C-W>k", { desc = "Go to window above" })
map("", "<C-h>", "<C-W>h", { desc = "Go to window left" })
map("", "<C-l>", "<C-W>l", { desc = "Go to window right" })

map("t", "<Esc>", "<C-\\><C-n>", { silent = true, desc = "Terminal normal mode" })
