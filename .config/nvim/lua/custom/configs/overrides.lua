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


M.treesitter = {
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
    matchup = {
      enable = true,
    },
}

M.nvimtree = {
    filters = {
      dotfiles = true,
    },
    git = { enable = true, ignore = false },
    renderer = { highlight_git = true, icons = { show = { git = true } } },
}

M.mason = {
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
}

return M
