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
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
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
              vim.lsp.buf.format({ bufnr = buffer })
            end,
          })
        end
      end,
    }
  end
}
