-- Buffer tabs across the top
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      offsets = {
        { filetype = "neo-tree", text = "File Explorer", separator = true, text_align = "left" },
      },
    },
  },
}
