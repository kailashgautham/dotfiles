-- Language servers via Mason + the native vim.lsp.config API (Neovim 0.11+)
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		-- Diagnostic appearance
		vim.diagnostic.config({
			virtual_text = { prefix = "●" },
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			float = { border = "rounded", source = true },
		})

		-- Buffer-local keymaps once a server attaches
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
			callback = function(ev)
				local map = function(keys, fn, desc)
					vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
				end
				map("gd", vim.lsp.buf.definition, "Goto definition")
				map("gD", vim.lsp.buf.declaration, "Goto declaration")
				map("gr", vim.lsp.buf.references, "References")
				map("gI", vim.lsp.buf.implementation, "Goto implementation")
				map("K", vim.lsp.buf.hover, "Hover docs")
				map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
				map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
				map("<leader>ca", vim.lsp.buf.code_action, "Code action")
				map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
				map("[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, "Prev diagnostic")
				map("]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, "Next diagnostic")
			end,
		})

		-- Completion capabilities come from blink.cmp; apply to every server
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		-- Per-server overrides
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.config("clangd", {
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--fallback-style=llvm",
				"--query-driver=/opt/watcom/binl64/wcc",
			},
			capabilities = { offsetEncoding = { "utf-16" } },
		})

		vim.lsp.config("asm_lsp", {
			cmd = { "asm-lsp" },
			filetypes = { "asm", "s", "vmasm" },
		})
		vim.lsp.enable("asm_lsp")

		-- Install + auto-enable the servers below
		require("mason").setup()

		-- Detect if we're on the homelab server (headless, avoid installing dev tooling)
		local is_server = vim.fn.hostname() == "kailash-homelab"

		-- Auto-install formatters/linters used by conform.nvim (skip on server)
		require("mason-tool-installer").setup({
			ensure_installed = is_server and {} or { "stylua", "prettier", "black", "isort" },
		})

		require("mason-lspconfig").setup({
			ensure_installed = is_server and {} or {
				"lua_ls",
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"bashls",
				"clangd",
			},
			automatic_enable = true,
		})
	end,
}
