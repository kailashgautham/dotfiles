-- Highlights color codes like #1a1b26 or rgb(...) with their actual color.
return {
  "catgoose/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    user_default_options = { tailwind = true, css = true, names = false },
  },
}
