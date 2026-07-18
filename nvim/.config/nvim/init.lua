-- ============================================================
--  init.lua  -  entry point
-- ============================================================
-- Leader keys MUST be set before lazy.nvim loads any plugin.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

vim.diagnostic.config({
	virtual_text = {
		spacing = 4, -- Amount of spaces to separate the code from the error
		prefix = "●", -- The prefix symbol to display before the error message
	},
	-- Optional settings to enhance the error display
	severity_sort = true, -- Order diagnostics by severity (errors first)
	signs = true, -- Show icons in the gutter/sign column
	underline = true, -- Underline the precise error location
})
