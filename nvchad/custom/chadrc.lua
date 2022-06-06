local M = {}

local override = require "custom.override"
M.ui = { theme = "tokyodark", hl_override = require "custom.highlights" }
M.plugins = {
  options = { lspconfig = { setup_lspconf = "custom.plugins.configs.lspconfig" } },
  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
  },
  user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

M.options = {
   user = function()
      vim.opt.clipboard = "unnamedplus"
   end,
}

return M
