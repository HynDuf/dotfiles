-- overriding default plugin configs!
local M = {}

M.statusline_overrides = function()
  local st_modules = require "nvchad_ui.statusline.modules"

  local function nvim_navic()
    local navic = require "nvim-navic"

    if navic.is_available() then
      return navic.get_location()
    else
      return " "
    end
  end
  -- override lsp_progress statusline module
  return {
    LSP_progress = function()
      if rawget(vim, "lsp") then
        return st_modules.LSP_progress() .. "%#Nvim_navic#" .. nvim_navic()
      else
        return ""
      end
    end,
  }
end

M.nvchad_ui = {
  override_options = {
    statusline = {
      overriden_modules = M.statusline_overrides,
    },
  },
}

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
