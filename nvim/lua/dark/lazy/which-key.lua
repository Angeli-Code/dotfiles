return {
  "folke/which-key.nvim",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gs"] = { name = "+surround" },
      ["z"] = { name = "+fold" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },

      -- Oil
      ["<leader>o"] = { name = "+Oil" },


      -- Coding 
      ["<leader>c"] = { name = "+Code" },
      ["<leader>ct"] = { name = "+Undo-Tree" },
      ["<leader>cT"] = { name = "+Trouble" },

      -- Finder
      ["<leader>f"] = { name = "+Telescope" },

      --Harpoon
      ["<leader>h"] = { name = "+Harpoon"},

      -- Management
      ["<leader>m"] = { name = "+Managers"},
      ["<leader>ma"] = { name = "+Mason"},
      ["<leader>mg"] = { name = "+Lazy-Git"},

      -- Tools
      ["<leader>t"] = { name = "+Tools"},

      -- Google
      ["<leader>tg"] = { name = "+Google"},
      ["<leader>tgs"] = { name = "+Google Search"},
      ["<leader>tp"] = { name = "+Parse"},
      ["<leader>tpj"] = { name = "+Parse Javadoc"},

      -- Live Server
      ["<leader>ts"] = { name = "+Live Server"},
      ["<leader>tso"] = { name = "+Open Server"},
      ["<leader>tlk"] = { name = "+Kill All Servers"},

      -- Libre Notes
      ["<leader>tl"] = { name = "+Libre Notes"},
      ["<leader>tln"] = { name = "+Create Libre Note"},
      ["<leader>tlc"] = { name = "+Libre Note to PDF"},

      -- Misc
      ["<leader>te"] = { name = "+Make File Executable"},
      ["<leader>ta"] = { name = "+Assembly Reference"},
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
