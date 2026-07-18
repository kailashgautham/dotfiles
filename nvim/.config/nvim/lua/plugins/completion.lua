-- Autocompletion engine (fast, minimal config)
return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "*",                       -- use a built release (prebuilt fuzzy lib)
  dependencies = { "rafamadriz/friendly-snippets" },
  ---@module 'blink.cmp'
  opts = {
    keymap = {
      preset = "default",
      ["<CR>"]    = { "accept", "fallback" },
      ["<Tab>"]   = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      menu = { border = "rounded" },
      ghost_text = { enabled = true },
    },
    signature = { enabled = true },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
