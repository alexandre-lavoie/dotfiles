-- Navigation

vim.opt.virtualedit = "onemore"
vim.opt.whichwrap:append("<,>,h,l")

vim.keymap.set("n", "<C-Left>", "b", { noremap = true, desc = "Jump back to start of previous word" })
vim.keymap.set("n", "<C-Right>", "el", { noremap = true, desc = "Jump forward to start of next word" })

vim.keymap.set("n", "<C-S-Left>", "vb", { noremap = true, desc = "Start visual mode and jump back to start of previous word" })
vim.keymap.set("v", "<C-S-Left>", "b", { noremap = true, desc = "Jump back to start of previous word" })
vim.keymap.set("n", "<C-S-Right>", "<C-v>el", { noremap = true, desc = "Start visual mode and jump forward to start of next word" })
vim.keymap.set("v", "<C-S-Right>", "el", { noremap = true, desc = "Jump forward to start of next word" })

vim.keymap.set("n", "<S-Up>", "vk", { noremap = true, desc = "Start visual mode and move up a line" })
vim.keymap.set("v", "<S-Up>", "k", { noremap = true, desc = "Move up one line" })
vim.keymap.set("n", "<S-Down>", "vj", { noremap = true, desc = "Start visual mode and move down a line" })
vim.keymap.set("v", "<S-Down>", "j", { noremap = true, desc = "Move down a line" })
vim.keymap.set("n", "<S-Left>", "vh", { noremap = true, desc = "Start visual mode and move left" })
vim.keymap.set("v", "<S-Left>", "h", { noremap = true, desc = "Move left" })
vim.keymap.set("n", "<S-Right>", "vl", { noremap = true, desc = "Start visual mode and move right" })
vim.keymap.set("v", "<S-Right>", "l", { noremap = true, desc = "Move right" })

vim.keymap.set("n", "<C-Up>", "<C-e>", { noremap = true, desc = "Move view up" })
vim.keymap.set("n", "<C-Down>", "<C-y>", { noremap = true, desc = "Move view down" })

vim.keymap.set("n", "<C-g>", ":", { noremap = true, desc = "Jump to line" })

-- Edit

vim.keymap.set("v", "<C-c>", "y", { noremap = true, desc = "Copy selection" })
vim.keymap.set("v", "<C-x>", "d", { noremap = true, desc = "Cut selection" })
vim.keymap.set("n", "<C-v>", "p", { noremap = true, desc = "Paste main clipboard" })
vim.keymap.set("v", "<C-v>", "p", { noremap = true, desc = "Paste main clipboard" })

vim.keymap.set("n", "<C-z>", "u", { noremap = true, desc = "Undo" })
vim.keymap.set("n", "<C-y>", "<C-R>", { noremap = true, desc = "Redo" })

vim.keymap.set("n", "<A-Up>", ":move -2<CR>", { noremap = true, desc = "Move line up" })
vim.keymap.set("n", "<A-Down>", ":move +1<CR>", { noremap = true, desc = "Move line down" })
vim.keymap.set("v", "<A-Up>", ":move '<-2<CR>", { noremap = true, desc = "Move line up" })
vim.keymap.set("v", "<A-Down>", ":move '>+1<CR>", { noremap = true, desc = "Move line down" })

vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, { noremap = true, desc = "Rename symbol" })

-- Search

vim.keymap.set("n", "<C-f>", "/", { noremap = true, desc = "Search current file for text" })
vim.keymap.set("n", "<C-S-f>", function() Snacks.picker.grep() end, { noremap = true, desc = "Search all files for text" })
vim.keymap.set("n", "<C-p>", function() Snacks.picker.files({ hidden = true, ignored = true, follow = true }) end, { noremap = true, desc = "Search for a file" })
vim.keymap.set("n", "<C-S-o>", function() Snacks.picker.lsp_symbols() end, { noremap = true })

-- Editor

vim.keymap.set("n", "<C-q>", ":q<CR>", { noremap = true, desc = "Quit" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, desc = "Save" })
vim.keymap.set("n", "<C-S-p>", ":", { noremap = true, desc = "Run command" })
vim.keymap.set("n", "<C-`>", function() Snacks.terminal.toggle() end, { noremap = true, desc = "Open terminal" })
vim.keymap.set("t", "<C-`>", function() Snacks.terminal.toggle() end, { noremap = true, desc = "Close terminal" })
