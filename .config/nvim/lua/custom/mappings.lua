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
-- add this table only when you want to disable default keys
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
  },

  v = {
    -- move selected lines up/down
    ["<C-j>"] = { ":m '>+1<CR>gv=gv", "  vmove lines down" },
    ["<C-k>"] = { ":m '<-2<CR>gv=gv", "  vmove lines up" },
  },
}

return M
