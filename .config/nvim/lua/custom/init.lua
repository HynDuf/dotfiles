-- load your globals, autocmds here or anything .__.
vim.g.lightspeed_last_motion = ""
vim.g.yankring_clipboard_monitor = 0
vim.g.matchup_delim_stopline = 1000
vim.g.matchup_matchparen_stopline = 300
vim.keymap.set("x", "p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true

require "custom.autocmds"
