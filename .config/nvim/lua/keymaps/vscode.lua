-- Navigation

vim.opt.virtualedit = "onemore"
vim.opt.whichwrap:append("<,>,h,l")

vim.keymap.set("n", "<C-Left>", "b", { noremap = true })
vim.keymap.set("n", "<C-Right>", "el", { noremap = true })

vim.keymap.set("n", "<C-S-Left>", "vb", { noremap = true })
vim.keymap.set("v", "<C-S-Left>", "b", { noremap = true })
vim.keymap.set("n", "<C-S-Right>", "<C-v>el", { noremap = true })
vim.keymap.set("v", "<C-S-Right>", "e", { noremap = true })

vim.keymap.set("n", "<S-Up>", "vk", { noremap = true })
vim.keymap.set("v", "<S-Up>", "k", { noremap = true })
vim.keymap.set("n", "<S-Down>", "vj", { noremap = true })
vim.keymap.set("v", "<S-Down>", "j", { noremap = true })
vim.keymap.set("n", "<S-Left>", "vh", { noremap = true })
vim.keymap.set("v", "<S-Left>", "h", { noremap = true })
vim.keymap.set("n", "<S-Right>", "vl", { noremap = true })
vim.keymap.set("v", "<S-Right>", "l", { noremap = true })

vim.keymap.set("v", "<Left>", "<Esc>", { noremap = true })
vim.keymap.set("v", "<Right>", "<Esc>", { noremap = true })
vim.keymap.set("v", "<Up>", "<Esc>", { noremap = true })
vim.keymap.set("v", "<Down>", "<Esc>", { noremap = true })

vim.keymap.set("n", "<C-Up>", "<C-e>", { noremap = true })
vim.keymap.set("n", "<C-Down>", "<C-y>", { noremap = true })

vim.keymap.set("n", "<C-g>", ":", { noremap = true })

-- Edit

vim.keymap.set("v", "<C-c>", "y", { noremap = true })
vim.keymap.set("v", "<C-x>", "d", { noremap = true })
vim.keymap.set("n", "<C-v>", "p", { noremap = true })
vim.keymap.set("v", "<C-v>", "p", { noremap = true })

vim.keymap.set("n", "<C-z>", "u", { noremap = true })
vim.keymap.set("n", "<C-y>", "<C-R>", { noremap = true })

vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true })

-- Search

vim.keymap.set("n", "<C-f>", "/", { noremap = true })
vim.keymap.set("n", "<C-S-f>", "<cmd>lua Snacks.picker.grep()<CR>", { noremap = true })
vim.keymap.set("n", "<C-p>", "<cmd>lua Snacks.picker.files()<CR>", { noremap = true })
vim.keymap.set("n", "<C-S-o>", "<cmd>lua Snacks.picker.lsp_symbols()<CR>", { noremap = true })

-- Editor

vim.keymap.set("n", "<C-S-p>", ":", { noremap = true })
vim.keymap.set("n", "<C-`>", "<cmd>lua Snacks.terminal.toggle()<CR>", { noremap = true })
vim.keymap.set("t", "<C-`>", "<cmd>lua Snacks.terminal.toggle()<CR>", { noremap = true })
