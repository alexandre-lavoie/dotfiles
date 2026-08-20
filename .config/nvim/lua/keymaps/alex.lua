-- Tools

vim.keymap.set("n", "git", function() Snacks.lazygit.open() end, { noremap = true, desc = "Open LazyGit" })

vim.keymap.set("n", "y#r", function()
  local path = vim.fn.expand("%:.")
  if path == "" then
    vim.notify("Current buffer has no file path", vim.log.levels.WARN)
    return
  end

  local location = string.format("%s:%d", path, vim.fn.line("."))
  vim.fn.setreg("+", location)
  vim.notify("Yanked " .. location)
end, { desc = "Yank relative path and line number" })

vim.keymap.set("n", "y#a", function()
  local path = vim.fn.expand("%:p")
  if path == "" then
    vim.notify("Current buffer has no file path", vim.log.levels.WARN)
    return
  end

  vim.fn.setreg("+", path)
  vim.notify("Yanked " .. path)
end, { desc = "Yank absolute path" })

vim.keymap.set("n", "y#l", function()
  local line = tostring(vim.fn.line("."))
  vim.fn.setreg("+", line)
  vim.notify("Yanked line " .. line)
end, { desc = "Yank line number" })

vim.keymap.set("n", "y#g", function()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    vim.notify("Current buffer has no file path", vim.log.levels.WARN)
    return
  end

  local function git(args)
    table.insert(args, 1, "git")
    table.insert(args, 2, "-C")
    table.insert(args, 3, vim.fs.dirname(file))
    local result = vim.system(args, { text = true }):wait()
    return result.code == 0 and vim.trim(result.stdout) or nil
  end

  local root = git({ "rev-parse", "--show-toplevel" })
  local remote = git({ "remote", "get-url", "origin" })
  local branch = git({ "rev-parse", "--abbrev-ref", "HEAD" })
  if not root or not remote or not branch then
    vim.notify("Could not determine Git repository details", vim.log.levels.WARN)
    return
  end

  local repo = remote:match("github%.com[:/](.+)$")
  if not repo then
    vim.notify("The origin remote is not hosted on GitHub", vim.log.levels.WARN)
    return
  end

  repo = repo:gsub("%.git$", "")
  if branch == "HEAD" then
    branch = git({ "rev-parse", "HEAD" })
  end

  local function encode_path(path)
    return table.concat(vim.tbl_map(vim.uri_encode, vim.split(path, "/", { plain = true })), "/")
  end

  local path = vim.fs.relpath(root, file)
  local url = string.format(
    "https://github.com/%s/blob/%s/%s#L%d",
    repo,
    encode_path(branch),
    encode_path(path),
    vim.fn.line(".")
  )
  vim.fn.setreg("+", url)
  vim.notify("Yanked " .. url)
end, { desc = "Yank GitHub link for current line" })

-- Navigation

vim.keymap.set("n", "<Space><Left>", "<C-o>", { noremap = true, desc = "Go to previous mark" })
vim.keymap.set("n", "<Space><Right>", "<C-i>", { noremap = true, desc = "Go to next mark" })
vim.keymap.set("n", "<Space><Up>", function() Snacks.picker.lsp_definitions() end, { noremap = true, desc = "Go up to definition" })
vim.keymap.set("n", "<Space><Down>", function() Snacks.picker.lsp_references() end, { noremap = true, desc = "Go down to references" })
vim.keymap.set("n", "<Space><Space><Down>", function() Snacks.picker.lsp_implementations() end, { noremap = true, desc = "Go down to implementations" })
