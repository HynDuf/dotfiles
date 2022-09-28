local M = {}

M.ui = {
  theme = "tokyodark",
  hl_override = require("custom.highlights").override,
  theme_toggle = { "tokyodark", "one_light" },
  hl_add = require("custom.highlights").add,
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M
