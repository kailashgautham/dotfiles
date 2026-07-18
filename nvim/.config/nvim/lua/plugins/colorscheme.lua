-- Tokyo Night theme (matches the alacritty colors)
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,           -- load before everything else
  opts = {
    style = "night",         -- night | storm | moon | day
    transparent = false,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}
