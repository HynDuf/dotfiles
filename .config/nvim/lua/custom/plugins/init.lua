return {
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require("alpha").setup(require("alpha.themes.theta").config)
    end,
  },

  ["karb94/neoscroll.nvim"] = {
    event = "CursorMoved",
    config = function()
      require("neoscroll").setup()
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.configs.null-ls").setup()
    end,
  },

  ["jghauser/mkdir.nvim"] = { after = "nvim-treesitter" },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },
  ["iamcco/markdown-preview.nvim"] = {
      run = function() vim.fn["mkdp#util#install"]() end,
  }
}
