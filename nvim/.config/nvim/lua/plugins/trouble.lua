-- A nicer panel for diagnostics, references, symbols, quickfix, etc.
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = { focus = true },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
    { "<leader>xs", "<cmd>Trouble symbols toggle<cr>",                  desc = "Symbols outline" },
    { "<leader>xl", "<cmd>Trouble lsp toggle<cr>",                      desc = "LSP definitions/refs" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix list" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>",                     desc = "Todo list" },
  },
}
