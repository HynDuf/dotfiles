 local present, escape = pcall(require, "better_escape")

 if not present then
    return
 end

 local options = {
    mapping = { "jk" }, -- a table with mappings to use
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>",
 }

 options = require("core.utils").load_override(options, "max397574/better-escape.nvim")
 escape.setup(options)
