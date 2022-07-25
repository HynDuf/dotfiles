local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

    -- LuaFormatter off
    -- webdev stuff
    b.formatting.deno_fmt,
    b.formatting.prettierd.with({
        filetypes = { "html", "markdown", "css" }
    }),

    b.formatting.eslint_d,

    -- Lua
    b.formatting.lua_format.with({
        extra_args = {
            "--no-keep-simple-control-block-one-line",
            "--no-keep-simple-function-one-line",
            "--column-limit=50"
        }
    }),

    -- Shell
    b.formatting.shfmt,
    b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

    -- cpp
    b.formatting.clang_format.with({
        extra_args = { vim.fn.expand("-style=file") }
    }),

    -- python
    b.formatting.yapf,
    b.formatting.isort,

    -- java
    b.formatting.google_java_format.with({
        extra_args = {"--aosp"},
    }),

    -- xml
    b.diagnostics.tidy,
    b.formatting.tidy.with({
        extra_args = {"-q -xml"},
    }),
    b.formatting.xmllint,
    -- LuaFormatter on
}

local M = {}

M.setup = function()
    null_ls.setup {
        debug = true,
        sources = sources
    }
end

return M
