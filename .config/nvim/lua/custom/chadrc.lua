local M = {}

local override = require "custom.override"

M.ui = {
  theme = "tokyodark",
  hl_override = require "custom.highlights",
  theme_toggle = { "tokyodark", "one_light" },
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

return M
