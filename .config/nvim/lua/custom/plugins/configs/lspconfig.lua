local M = {}

M.setup_lsp = function(attach, capabilities)
    local lspconfig = require "lspconfig"

    -- lspservers with default config
    local servers = {"html", "cssls", "clangd", "eslint", "tsserver"}

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {on_attach = attach, capabilities = capabilities}
    end

    lspconfig.pylsp.setup {
        on_attach = attach,
        capabilities = capabilities,
    }

    lspconfig.jdtls.setup {
        on_attach = attach,
        capabilities = capabilities,
    }
end

require "custom.plugins.configs.lsp_handlers"

return M
