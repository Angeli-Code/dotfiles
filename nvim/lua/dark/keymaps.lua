-- Basic Keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Management Keymaps
vim.api.nvim_set_keymap("n", "<leader>l", ":Lazy home<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ms",":Mason<CR>", { noremap = true, silent = true })

-- Keymaps that connect to Auto-Commands
vim.api.nvim_set_keymap("n", "<leader>GS", ":GoogleSearch<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>LS", ":LiveServer<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>KS", ":KillLiveServers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>PJ", ":ParseJavadoc<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>zz", ":Zen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>TD", ":TmuxDetach<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>LN", ":LibreNote<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>LC", ":LibreConvert<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ME", ":MakeExecutable<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>LG", ":LazyGit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>wk", ":GhettoWhich<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>AR", ":AssemblyReference<CR>", { noremap = true, silent = true })

