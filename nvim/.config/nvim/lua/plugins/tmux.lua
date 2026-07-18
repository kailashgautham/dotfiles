-- Ctrl+h/j/k/l moves between nvim splits AND tmux panes seamlessly.
-- Requires the matching bindings in ~/.tmux.conf (included in this bundle).
return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>",     desc = "Window/pane left" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>",     desc = "Window/pane down" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>",       desc = "Window/pane up" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>",    desc = "Window/pane right" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Last window/pane" },
  },
}
