return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "gopls",
        "json-lsp",
        "lua-language-server",
        "pyright",
        "typescript-language-server",
        "vue-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("clangd", {})

      vim.lsp.config("gdscript", {
        cmd = { "nc", "localhost", "6005" },
        filetypes = { "gd", "gdscript" },
        on_attach = function(client, bufnr)
          vim.api.nvim_command('echo serverstart("/tmp/godot.pipe")')
        end,
        root_dir = function(fname)
          return vim.fs.dirname(
            vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]
          ) or vim.fn.getcwd()
        end,
      })

      vim.lsp.config("gopls", {})

      vim.lsp.config("jsonls", {})

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

      vim.lsp.config("pyright", {})

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

      vim.lsp.config("volar", {
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
      })
    end
  },
}
