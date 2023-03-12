local M = {}

M.ui = {
  theme = "tokyodark",
  hl_override = require("custom.highlights").override,
  theme_toggle = { "tokyodark", "one_light" },
  hl_add = require("custom.highlights").add,
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    overriden_modules = nil,
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
