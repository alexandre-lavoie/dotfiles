return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "gopls",
        "json-lsp",
        "lua-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("clangd")
      vim.lsp.enable("gopls")
      vim.lsp.enable("json-lsp")
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
	    workspace = {
		library = {
		    vim.env.VIMRUNTIME,
		},
	    },
          }
        }
      })
    end
  },
}
