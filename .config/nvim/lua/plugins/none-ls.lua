local lsp_format_group = vim.api.nvim_create_augroup("LspFormatting", {})
local autocomplete_group = vim.api.nvim_create_augroup("AutocompleteHover", {})

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = function()
    local null_ls = require("null-ls")

    return {
      sources = {
        null_ls.builtins.formatting.goimports.with({
          extra_args = function(params)
            local go_mod = vim.fs.find("go.mod", {
              path = vim.fs.dirname(params.bufname),
              upward = true,
            })[1]
            if not go_mod then
              return {}
            end

            local module_line = vim.fn.readfile(go_mod, "", 1)[1]
            local module = module_line and module_line:match("^module%s+(.+)%s*$")
            return module and { "-local", module } or {}
          end,
        }),
      },
      on_attach = function(client, buffer)
        if client.supports_method("textDocument/implementation") or client.supports_method("textDocument/completion") then
          vim.api.nvim_clear_autocmds({
            group = autocomplete_group,
            buffer = buffer,
          })

          vim.api.nvim_create_autocmd("CursorHold", {
            group = autocomplete_group,
            buffer = buffer,
            callback = function()
              vim.lsp.buf.hover()
            end,
          })
        end

        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = lsp_format_group,
            buffer = buffer,
          })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = lsp_format_group,
            buffer = buffer,
            callback = function()
              vim.lsp.buf.format({
                bufnr = buffer,
                filter = function(format_client)
                  return format_client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    }
  end
}
