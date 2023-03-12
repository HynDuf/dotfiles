local M = {}

M.disabled = {
  n = {
    ["ZZ"] = "",
  },
}

M.general = {
  i = {
    -- move a line up/down
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "  imove line down" },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "  imove line up" },
  },

  n = {
    -- new file vertical split
    ["<C-w><C-b>"] = { ":vnew<CR>", "new file vertical split" },
    -- move a line up/down
    ["<A-j>"] = { ":m .+1<CR>==", "  nmove line down" },
    ["<A-k>"] = { ":m .-2<CR>==", "  nmove line up" },

    -- move to the next openning instance ([{<
    ["]]"] = {
      ":call search('[([{<]')<CR>",
      "   move to next opening instance ([{<",
    },

    -- :q 
    ["<C-z>"] = {
      function()
        vim.cmd(string.format "silent :qa")
      end,
      "   close nvim",
    },

    -- do NvChadUpdate
    ["<leader>ud"] = { ":NvChadUpdate<CR>", "do NvChadUpdate" },

    -- jupyter-ascending
    ["<leader>jc"] = { "0C# %%<CR>", "insert code block" },
    ["<leader>jm"] = { "0C# %% [md]<CR>", "insert markdown block" },
    ["<leader>jr"] = { "0C# %% [raw]<CR>", "insert raw block" },
    ["<leader>jx"] = { "<Plug>JupyterExecute", "run a block of code of the jupyter notebook" },
    ["<leader>ja"] = { "<Plug>JupyterExecuteAll", "run a block of code of the jupyter notebook" },

    -- CP
    ["<F9>"] = {
      function()
        vim.cmd(string.format ":w")
        require("nvterm.terminal").send(
          "g++ -std=c++14 -DHynDuf "
            .. vim.fn.expand "%:p"
            .. " -o "
            .. vim.fn.expand "%:p:r"
            .. " && "
            .. vim.fn.expand "%:p:r"
        )
      end,
      " Compile and run cpp program",
    },

    ["<C-a>"] = { "ggVG", "Select all" },
  },

  v = {
    -- hove selected lines up/down
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "  vmove lines down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "  vmove lines up" },
  },
}

return M
