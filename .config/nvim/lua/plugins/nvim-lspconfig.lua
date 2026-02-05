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
      local lspconfig = require("lspconfig")

      lspconfig.clangd.setup({})

      lspconfig.gdscript.setup({
        cmd = { "ncat", "localhost", "6005" },
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

      lspconfig.gopls.setup({})

      lspconfig.jsonls.setup({})

      lspconfig.lua_ls.setup({
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

      lspconfig.pyright.setup({})

      lspconfig.ts_ls.setup({
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

      lspconfig.volar.setup({
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
      })
    end
  },
}
