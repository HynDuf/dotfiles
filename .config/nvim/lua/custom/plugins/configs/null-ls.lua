local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end
local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettierd.with {
    filetypes = { "html", "markdown", "css" },
  },

  b.formatting.eslint_d,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format.with {
    extra_args = { vim.fn.expand "-style=file" },
  },

  -- python
  b.formatting.yapf,
  b.formatting.isort,

  -- java
  b.formatting.google_java_format.with {
    extra_args = { "--aosp" },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
