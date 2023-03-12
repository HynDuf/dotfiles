local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end
local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt.with {
    extra_args = { "--options-indent-width", "4" },
  },
  b.formatting.prettierd.with {
    filetypes = { "html", "markdown", "css" },
  },

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format.with {
    disabled_filetypes = { "java" },
    extra_args = { "-style=file" },
  },

  -- python
  b.formatting.yapf,
  b.formatting.isort,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
