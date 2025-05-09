vim.opt.expandtab = true
vim.opt.autoindent = true

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local m = args.match

    if m == "lua" or m == "json" then
      vim.opt.shiftwidth = 2
    else
      vim.opt.shiftwidth = 4
    end
  end
})

