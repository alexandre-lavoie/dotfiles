-- Tools

vim.keymap.set("v", "git", "<cmd>lua Snacks.lazygit.open()<CR>", { noremap = true })

-- Navigation

vim.keymap.set("n", "<A-Left>", "<C-o>", { noremap = true })
vim.keymap.set("n", "<A-Right>", "<C-i>", { noremap = true })
vim.keymap.set("n", "<A-Up>", "<cmd>lua Snacks.picker.lsp_definitions()<CR>", { noremap = true })
vim.keymap.set("n", "<A-Down>", "<cmd>lua Snacks.picker.lsp_references()<CR>", { noremap = true })

