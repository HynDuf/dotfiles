-- overriding default plugin configs!
local M = {}

M.treesitter = {
  override_options = {
    ensure_installed = {
      "vim",
      "html",
      "css",
      "javascript",
      "json",
      "toml",
      "markdown",
      "c",
      "bash",
      "lua",
      "cpp",
      "python",
      "java",
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
  },
}

M.nvimtree = {
  override_options = {
    git = { enable = true, ignore = false },
    renderer = { highlight_git = true, icons = { show = { git = true } } },
  },
}

M.mason = {
  override_options = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- shell
      "shfmt",
      "shellcheck",

      -- c/cpp
      "clangd",

      -- java
      "jdtls",

      -- python
      "pyright",

      -- web dev
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "deno",
      "emmet-ls",
      "json-lsp",

      -- markdown
      "ltex-ls",
    },
  },
}

return M
