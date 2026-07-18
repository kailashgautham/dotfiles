-- ============================================================
--  Core editor options
-- ============================================================
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.fillchars = { eob = " " }

-- Behaviour
opt.mouse = "a"
opt.clipboard = "unnamedplus" -- use system clipboard
opt.splitright = true
opt.splitbelow = true
opt.undofile = true -- persistent undo
opt.swapfile = false
opt.backup = false
opt.updatetime = 250
opt.timeoutlen = 400
opt.completeopt = "menuone,noselect"
opt.confirm = true -- ask to save instead of erroring
