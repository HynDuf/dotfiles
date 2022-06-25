local M = {}
-- add this table only when you want to disable default keys
M.disabled = {n = {["<S-b>"] = ""}}
M.general = {
    i = {
        -- move a line up/down
        ["<C-j>"] = {"<Esc>:m .+1<CR>==gi", "  imove line down"},
        ["<C-k>"] = {"<Esc>:m .-2<CR>==gi", "  imove line up"}
    },

    n = {
        -- move a line up/down
        ["<C-j>"] = {":m .+1<CR>==", "  nmove line down"},
        ["<C-k>"] = {":m .-2<CR>==", "  nmove line up"},

        -- delete content inside parenthesis block and enter insert mode
        ["<A-r>"] = {"vibc", "   delete inner block, enter insert mode"},

        -- move to the next openning instance ([{<
        ["]]"] = {
            ":call search('[([{<]')<CR>",
            "   move to next opening instance ([{<"
        }
    },

    v = {
        -- move selected lines up/down
        ["<C-j>"] = {":m '>+1<CR>gv=gv", "  vmove lines down"},
        ["<C-k>"] = {":m '<-2<CR>gv=gv", "  vmove lines up"}

    }

}

M.tabufline = {n = {["<leader>b"] = {"<cmd> enew <CR>", "烙 new buffer"}}}

return M
