local M = {}

local override = require "custom.override"

M.ui = {
  theme = "tokyodark",
  hl_override = require "custom.highlights",
}

M.plugins = {
  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["williamboman/mason.nvim"] = override.mason,
  },

  user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

M.options = {
  user = function()
    vim.opt.clipboard = "unnamedplus"
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
  end,
}

return M
