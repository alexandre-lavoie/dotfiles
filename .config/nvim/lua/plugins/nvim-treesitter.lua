return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local tree = require("nvim-treesitter")

    tree.setup({})
    tree.install({
      "c",
      "gdscript",
      "godot_resource",
      "gdshader",
      "gitignore",
      "go",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "typescript",
    })

    local grp = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = grp,
      callback = function(event)
        if vim.list_contains(tree.get_installed(), vim.treesitter.language.get_lang(event.match)) then
	         vim.treesitter.start(event.buf)
        end
      end,
    })
  end,
}
