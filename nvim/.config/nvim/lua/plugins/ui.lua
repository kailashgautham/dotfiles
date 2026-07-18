-- Aesthetic UI overhaul: centered command palette, popup messages,
-- bordered LSP hover/signature, and pretty notifications.
return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2500,
      stages = "fade",
      render = "compact",
      background_colour = "#1a1b26",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,        -- /search at the bottom
        command_palette = true,      -- cmdline + popupmenu together, centered
        long_message_to_split = true,
        lsp_doc_border = true,       -- borders on hover docs
      },
    },
  },
}
