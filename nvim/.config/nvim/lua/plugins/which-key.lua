-- Shows a popup of available keybindings as you type the leader key
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>f", group = "find" },
      { "<leader>h", group = "git hunks" },
      { "<leader>g", group = "git" },
      { "<leader>c", group = "code" },
      { "<leader>b", group = "buffer" },
      { "<leader>r", group = "rename" },
      { "<leader>x", group = "diagnostics/trouble" },
    },
  },
}
