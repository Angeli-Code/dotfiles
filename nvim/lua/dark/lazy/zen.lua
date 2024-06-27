local autocommands = require("dark.autocmds")

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
  config = function(_, opts)
    require("zen-mode").setup(opts)

    local function toggle_zen_mode_and_opacity()
      require("zen-mode").toggle()  -- Toggle Zen Mode using the plugin
      autocommands.toggle_alacritty_opacity()  -- Call the function to toggle Alacritty opacity
    end

    vim.api.nvim_create_user_command("ZenToggle", toggle_zen_mode_and_opacity, {})
  end
}

