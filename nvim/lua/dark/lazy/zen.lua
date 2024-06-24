return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.95,
      width = 120,
      height = 1,
      options = {},
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      tmux = { enabled = false },
      alacritty = {
        enabled = true,
        font = "18",
        opacity = 1.0,
      },
    },
  },
}
