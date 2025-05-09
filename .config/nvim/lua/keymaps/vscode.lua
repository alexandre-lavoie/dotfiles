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

vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, { noremap = true })

-- Search

vim.keymap.set("n", "<C-f>", "/", { noremap = true })
vim.keymap.set("n", "<C-S-f>", function() Snacks.picker.grep() end, { noremap = ue })
vim.keymap.set("n", "<C-p>", function() Snacks.picker.files() end, { noremap = true })
vim.keymap.set("n", "<C-S-o>", function() Snacks.picker.lsp_symbols() end, { noremap = true })

-- Editor

vim.keymap.set("n", "<C-q>", ":q<CR>", { noremap = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true })
vim.keymap.set("n", "<C-S-p>", ":", { noremap = true })
vim.keymap.set("n", "<C-`>", function() Snacks.terminal.toggle() end, { noremap = true })
vim.keymap.set("t", "<C-`>", function() Snacks.terminal.toggle() end, { noremap = true })
