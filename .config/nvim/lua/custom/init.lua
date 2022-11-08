-- load your globals, autocmds here or anything .__.
vim.g.window_id = vim.fn.system "xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$'"
vim.g.lightspeed_last_motion = ""

vim.keymap.set("x", "p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true

require "custom.autocmds"
