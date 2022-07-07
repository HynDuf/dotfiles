-- overriding default plugin configs!
local M = {}

M.treesitter = {
    ensure_installed = {
        "vim", "html", "css", "javascript", "json", "markdown", "c", "bash",
        "lua", "cpp", "python", "java"
    }
}

M.nvimtree = {
    git = {enable = true, ignore = false},
    renderer = {highlight_git = true, icons = {show = {git = true}}}
}

return M
