-- Dynamic terminal padding with/without nvim
-- replace stuff from file
local function sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
end

-- reloads xresources for current focused window only
local function liveReload_xresources()
  vim.cmd(
    string.format "silent !xrdb merge ~/.Xresources && kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"
  )
end

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
    -- move a line up/down
    ["<A-j>"] = { ":m .+1<CR>==", "  nmove line down" },
    ["<A-k>"] = { ":m .-2<CR>==", "  nmove line up" },

    -- move to the next openning instance ([{<
    ["]]"] = {
      ":call search('[([{<]')<CR>",
      "   move to next opening instance ([{<",
    },

    -- :q and readding the border in st
    ["<C-z>"] = {
      function()
        sed("st.borderpx: 0", "st.borderpx: 25", "~/.Xresources")
        liveReload_xresources()
        vim.cmd(string.format "silent :qa")
      end,
      "   close and add st border",
    },

    -- do PackerSync
    ["<leader>ud"] = { ":PackerSync<CR>", "do PackerSync" },

    -- jupyter-ascending
    ["<leader>jc"] = { "cc# %%<CR>", "insert code block" },
    ["<leader>jm"] = { "cc# %% [md]<CR>", "insert markdown block" },
    ["<leader>jr"] = { "cc# %% [raw]<CR>", "insert raw block" },
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
    -- move selected lines up/down
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "  vmove lines down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "  vmove lines up" },
  },
}

return M
