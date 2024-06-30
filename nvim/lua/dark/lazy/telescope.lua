return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.8",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    local telescope = require('telescope')
    telescope.setup({})

    local builtin = require('telescope.builtin')

    -- From Current Directory
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files from current directory" })
    vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Grep files from current directory" })

    -- From Root Directory
    vim.keymap.set("n", "<leader>fF", function()
      builtin.find_files({ cwd = "/" })
    end, { desc = "Find files from root directory" })

    vim.keymap.set("n", "<leader>fW", function()
      builtin.live_grep({ cwd = "/" })
    end, { desc = "Grep files from root directory" })
  end
}
