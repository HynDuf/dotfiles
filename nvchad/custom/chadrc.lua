-- Just an example, supposed to be placed in /lua/custom/
local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:q

M.ui = { theme = "tokyonight" }
M.plugins = {
   options = { lspconfig = { setup_lspconf = "custom.plugins.configs.lspconfig" } },
   user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

M.options = {
   user = function()
      vim.opt.clipboard = "unnamedplus"
   end,
}

return M
