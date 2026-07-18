-- Lightning jump: press `s` then type 2 chars + a label to teleport the cursor.
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash jump" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
  },
}
