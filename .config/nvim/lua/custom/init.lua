-- load your globals, autocmds here or anything .__.
require "custom.autocmd"

vim.keymap.set("x", "p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })
