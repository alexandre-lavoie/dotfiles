vim.opt.autoindent = true

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local m = args.match

    if m == "lua" or m == "json" or m == "vue" or m == "yaml" then
      vim.opt.expandtab = true
      vim.opt.tabstop = 1
      vim.opt.shiftwidth = 2
      vim.opt.softtabstop = 2
    elseif m == "gitconfig" or m == "go" or m == "make" then
      vim.opt.tabstop = 4
    else
      vim.opt.expandtab = true
      vim.opt.tabstop = 1
      vim.opt.shiftwidth = 4
      vim.opt.softtabstop = 4
    end
  end
})

