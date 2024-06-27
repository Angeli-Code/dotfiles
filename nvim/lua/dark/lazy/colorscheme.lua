return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
      },

      styles = {
        bold = false,
        italic = false,
        transparency = true,
      },
    })
    vim.cmd("colorscheme rose-pine")
  end
}
