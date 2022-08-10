local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "jdtls", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = vim.tbl_deep_extend("force", capabilities, { offsetEncoding = "utf-8" }),
}
