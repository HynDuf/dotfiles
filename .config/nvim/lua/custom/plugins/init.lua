local override = require "custom.plugins.override"

return {
  -- Override definition
  ["L3MON4D3/LuaSnip"] = {
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("custom.plugins.configs.misc").luasnip()
    end,
  },
  ["hrsh7th/nvim-cmp"] = {
    after = "friendly-snippets",
    config = function()
      require "custom.plugins.configs.cmp"
    end,
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require("alpha").setup(require("alpha.themes.theta").config)
    end,
  },

  -- Override plugins config (partly)
  ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
  ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
  ["williamboman/mason.nvim"] = override.mason,
  ["NvChad/ui"] = override.nvchad_ui,

  -- Custom plugins
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

  ["mfussenegger/nvim-jdtls"] = { opt = true },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },

  ["iamcco/markdown-preview.nvim"] = {
    ft = "markdown",
    after = "nvim-treesitter",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- fzf for telescope
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    after = "telescope.nvim",
    run = "make",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },

  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "media_files"
    end,
  },

  ["simrat39/rust-tools.nvim"] = {
    ft = "rust",
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

  ["tpope/vim-repeat"] = {
    event = "CursorMoved",
  },

  ["ggandor/lightspeed.nvim"] = {
    after = "nvim-treesitter",
  },

  ["kylechui/nvim-surround"] = {
    after = "neoscroll.nvim",
    config = function()
      require("nvim-surround").setup { keymaps = { visual = "gs" } }
    end,
  },

  ["mfussenegger/nvim-dap"] = {
    module = "dap",
    -- ft = {"cpp"},
    config = function()
      require "custom.plugins.configs.dap"
    end,
  },

  ["rcarriga/nvim-dap-ui"] = {
    module = "dapui",
    -- ft = {"cpp"},
    config = function()
      require "custom.plugins.configs.dap.ui"
    end,
  },

  ["SmiteshP/nvim-navic"] = {
    module = "nvim-navic",
    config = function()
      require("nvim-navic").setup {
        highlight = true,
      }
    end,
  },

  ["andymass/vim-matchup"] = {},
}
