local M = {}

M.ui = {
  theme = "tokyodark",
  hl_override = require "custom.highlights",
  theme_toggle = { "tokyodark", "one_light" },
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M
