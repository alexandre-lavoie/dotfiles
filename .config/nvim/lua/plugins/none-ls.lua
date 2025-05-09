local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = buffer,
          })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
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
