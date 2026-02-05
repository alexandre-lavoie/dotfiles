-- Tools

vim.keymap.set("n", "git", function() Snacks.lazygit.open() end, { noremap = true, desc = "Open LazyGit" })

-- Navigation

vim.keymap.set("n", "<Space><Left>", "<C-o>", { noremap = true, desc = "Go to previous mark" })
vim.keymap.set("n", "<Space><Right>", "<C-i>", { noremap = true, desc = "Go to next mark" })
vim.keymap.set("n", "<Space><Up>", function() Snacks.picker.lsp_definitions() end, { noremap = true, desc = "Go up to definition" })
vim.keymap.set("n", "<Space><Down>", function() Snacks.picker.lsp_references() end, { noremap = true, desc = "Go down to references" })
vim.keymap.set("n", "<Space><Space><Down>", function() Snacks.picker.lsp_implementations() end, { noremap = true, desc = "Go down to implementations" })
