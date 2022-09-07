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
      require "custom.plugins.configs.null-ls"
    end,
  },
  ["mfussenegger/nvim-jdtls"] = { after = "nvim-treesitter" },
  ["jghauser/mkdir.nvim"] = { after = "nvim-treesitter" },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },
  ["iamcco/markdown-preview.nvim"] = {
    after = "nvim-treesitter",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- fzf for telescope
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    before = "telescope.nvim",
    run = "make",
  },

  ["simrat39/rust-tools.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("rust-tools").setup()
    end,
  },

  -- autoclose tags in html, jsx etc
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.configs.misc").autotag()
    end,
  },

  ["untitled-ai/jupyter_ascending.vim"] = {
    ft = { "python" },
    after = "nvim-treesitter",
  },
}
