local M = {}

local override = require "custom.override"
M.ui = {
    theme = "rxyhn",
    hl_override = require "custom.highlights"
}

M.plugins = {
    options = {
        lspconfig = {setup_lspconf = "custom.plugins.configs.lspconfig"}
    },
    override = {
        ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
        ["kyazdani42/nvim-tree.lua"] = override.nvimtree
    },
    user = require "custom.plugins"
}

M.mappings = require "custom.mappings"

M.options = {
    user = function()
        vim.opt.clipboard = "unnamedplus"
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
    end
}

return M
