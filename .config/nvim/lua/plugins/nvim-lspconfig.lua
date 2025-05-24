return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "gopls",
        "json-lsp",
        "lua-language-server",
        "typescript-language-server",
        "vue-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("clangd")
      vim.lsp.enable("gopls")
      vim.lsp.config("json-lsp", {})
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
      vim.lsp.enable("lua_ls")
      vim.lsp.config("ts_ls", {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
              languages = { "vue" },
            }
          }
        }
      })
      vim.lsp.enable("ts_ls")
      vim.lsp.config("volar", {
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
      })
      vim.lsp.enable("volar")
    end
  },
}
