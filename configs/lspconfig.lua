local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "tailwindcss" , "prismals"}

-- local on_attach = function(client, bufnr)
--   -- format on save
--   if client.server_capabilities.documentFormattingProvider then
--     vim.api.nvim_command [[augroup Format]]
--     vim.api.nvim_command [[autocmd! * <buffer>]]
--     vim.api.nvim_command [[autocmd! BufWritePre <buffer> lua vim.lsp.buf.format()]]
--     vim.api.nvim_command [[autogroup END]]
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = vim.api.nvim_create_augroup("Format", { clear = true }),
--       buffer = bufnr,
--       -- callback = fu enction() vim.lsp.buf.formatting_seq_sync() end
--       --
--       --
--       callback = function()
--         vim.lsp.buf.format()
--       end,
--     })
--   end
-- end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
--
--
lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}

