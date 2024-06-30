-- Basic Keymaps
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<leader>td", ":TmuxDetach<CR>", { noremap = true, silent = true })

-- Management Keymaps
vim.api.nvim_set_keymap("n", "<leader>l", ":Lazy home<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ms",":Mason<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>o",":Oil<CR>", { noremap = true, silent = true })

-- Keymaps that connect to Auto-Commands
vim.api.nvim_set_keymap("n", "<leader>tgs", ":GoogleSearch<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tso", ":LiveServer<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tsk", ":KillLiveServers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tpj", ":ParseJavadoc<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tln", ":LibreNote<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tlc", ":LibreConvert<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ta", ":AssemblyReference<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>te", ":MakeExecutable<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mG", ":LazyGit<CR>", { noremap = true, silent = true })
