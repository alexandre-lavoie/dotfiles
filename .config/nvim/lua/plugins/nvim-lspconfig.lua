return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "gopls",
        "jsonls",
        "lua_ls",
        "pyright",
        "ts_ls",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("clangd", {})
      vim.lsp.enable("clangd")

      vim.lsp.config("gdscript", {
        cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
        filetypes = { "gdscript", "gdshader" },
        root_dir = function(fname)
          return vim.fs.dirname(
            vim.fs.find({ "project.godot", ".git" },
              {
                upward = true
              }
            )[1]
          ) or vim.fn.getcwd()
        end,
      })
      vim.lsp.enable("gdscript")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "gdscript", "gdshader" },
        callback = function(args)
          vim.lsp.start(vim.lsp.config.gdscript)
        end,
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            buildFlags = { "-tags=integration,test,tools" },
          },
        },
      })
      vim.lsp.enable("gopls")

      vim.lsp.config("jsonls", {})
      vim.lsp.enable("jsonls")

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

      vim.lsp.config("pyright", {})
      vim.lsp.enable("pyright")

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
    end
  },
}
