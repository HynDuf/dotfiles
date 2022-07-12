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

    lspconfig.java_language_server.setup {
        on_attach = attach,
        capabilities = capabilities,
        cmd = {"/home/hynduf/Downloads/java-language-server/dist/lang_server_linux.sh"},
        root_dir = vim.loop.cwd,
    }
end

require "custom.plugins.configs.lsp_handlers"

return M
