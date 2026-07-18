-- The "homepage" you see when you run `nvim` in a folder with no file
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
      [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
      [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
      [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
      [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
      [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file",    "<cmd>Telescope find_files<cr>"),
      dashboard.button("n", "  New file",     "<cmd>ene <BAR> startinsert<cr>"),
      dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("g", "  Find text",    "<cmd>Telescope live_grep<cr>"),
      dashboard.button("e", "  File tree",    "<cmd>Neotree toggle<cr>"),
      dashboard.button("c", "  Config",       "<cmd>cd ~/.config/nvim <BAR> Telescope find_files<cr>"),
      dashboard.button("l", "󰒲  Lazy",         "<cmd>Lazy<cr>"),
      dashboard.button("m", "  Mason",        "<cmd>Mason<cr>"),
      dashboard.button("q", "  Quit",         "<cmd>qa<cr>"),
    }

    -- Style the buttons
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.opts.layout[1].val = 6

    -- Footer: show how many plugins loaded + startup time
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        dashboard.section.footer.val = "⚡ " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    alpha.setup(dashboard.opts)
  end,
}
