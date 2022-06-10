local M = {}
-- add this table only when you want to disable default keys
M.disabled = {
   n = {
      ["<S-b>"] = "",
   },

}
M.general = {
   i = {
      -- move a line up/down
      ["<C-j>"] = { "<Esc>:m .+1<CR>==gi", "  imove line down" },
      ["<C-k>"] = { "<Esc>:m .-2<CR>==gi", "  imove line up" },
   },

   n = {
      -- move a line up/down
      ["<C-j>"] = { ":m .+1<CR>==", "  nmove line down" },
      ["<C-k>"] = { ":m .-2<CR>==", "  nmove line up" },

      -- delete content inside parenthesis block and enter insert mode
      ["<A-r>"] = { "vibc", "   delete inner block, enter insert mode" },
   },

   v = {
      -- move selected lines up/down
      ["<C-j>"] = { ":m '>+1<CR>gv=gv", "  vmove lines down" },
      ["<C-k>"] = { ":m '<-2<CR>gv=gv", "  vmove lines up" },

      -- return to normal mode
      ["jk"] = { "<ESC>", "   escape to normal mode" },
   },

}

M.telescope = {
   n = {
      ["<F9>"] = { "<cmd> Telescope lsp_implementations <CR>", "   lsp go to implementations" },
      ["<F12>"] = { "<cmd> Telescope lsp_definitions <CR>", "   lsp go to definitions" },
      ["<F10>"] = { "<cmd> Telescope lsp_references <CR>", "   lsp list all references" },
   },
}

M.bufferline = {
   n = {
      ["<leader>b"] = { "<cmd> enew <CR>", "烙 new buffer" },
   },
}

return M
