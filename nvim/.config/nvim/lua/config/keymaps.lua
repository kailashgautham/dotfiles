-- ============================================================
--  Global keymaps  (leader = <Space>)
-- ============================================================
local map = vim.keymap.set

-- NOTE: Ctrl + h/j/k/l window navigation is handled by vim-tmux-navigator
-- (see lua/plugins/tmux.lua) so the same keys move between nvim splits AND
-- tmux panes seamlessly.

-- Resize windows with Ctrl + arrows
map("n", "<C-Up>",    "<cmd>resize +2<cr>",          { desc = "Taller window" })
map("n", "<C-Down>",  "<cmd>resize -2<cr>",          { desc = "Shorter window" })
map("n", "<C-Left>",  "<cmd>vertical resize -2<cr>", { desc = "Narrower window" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Wider window" })

-- Move lines up/down with Alt + j/k
map("n", "<A-j>", "<cmd>m .+1<cr>==",       { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==",       { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv",       { desc = "Move block down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv",       { desc = "Move block up" })

-- Keep selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Clear search highlight with Esc
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Save / quit
map("n", "<leader>w", "<cmd>w<cr>",  { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>",  { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })

-- Buffers
map("n", "<S-l>",      "<cmd>bnext<cr>",     { desc = "Next buffer" })
map("n", "<S-h>",      "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>",   { desc = "Delete buffer" })
