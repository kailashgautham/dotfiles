-- Small quality-of-life editing plugins
return {
  -- Auto-close brackets/quotes
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  -- gcc / gc to (un)comment
  { "numToStr/Comment.nvim", event = { "BufReadPost", "BufNewFile" }, config = true },

  -- Add/change/delete surrounding pairs:  ys / cs / ds
  { "kylechui/nvim-surround", version = "*", event = { "BufReadPost", "BufNewFile" }, config = true },

  -- Highlight TODO / FIX / NOTE comments
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = true },
  },
}
