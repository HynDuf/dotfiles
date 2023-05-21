local overrides = require "custom.configs.overrides"

return {
  -- Override definition
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "williamboman/mason.nvim",
        config = function(_, opts)
          dofile(vim.g.base46_cache .. "mason")
          require("mason").setup(opts)
          vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
          end, {})
          require "custom.configs.lspconfig" -- Load in lsp config
        end,
      },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function() end, -- Override to setup mason-lspconfig
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require("custom.configs.misc").luasnip()
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },

    opts = function()
      return require "custom.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  -- Overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  -- Custom plugins
  {
    "cbochs/portal.nvim",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    event = "VeryLazy",
    ft = "markdown",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("obsidian").setup {
        dir = "~/Documents/Obsidian/Life",
        disable_frontmatter = true,
        completion = {
          nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        },
      }
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    enabled = true,
    config = function()
      require("alpha").setup(require("alpha.themes.theta").config)
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("neoscroll").setup()
    end,
  },

  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   after = "nvim-lspconfig",
  --   config = function()
  --     require "custom.configs.null-ls"
  --   end,
  -- },

  {
    "mfussenegger/nvim-jdtls",
  },

  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
    event = "VeryLazy",
    dependencies = {
      "telescope.nvim",
    },
    config = function()
      require("telescope").load_extension "media_files"
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    event = "VeryLazy",
    ft = "rust",
    dependencies = {
      "nvim-lspconfig",
    },
    config = function()
      require("rust-tools").setup()
    end,
  },

  -- autoclose tags in html, jsx etc
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    ft = { "html", "javascriptreact" },
    dependencies = {
      "nvim-treesitter",
    },
    config = function()
      require("custom.configs.misc").autotag()
    end,
  },

  {
    "untitled-ai/jupyter_ascending.vim",
    event = "VeryLazy",
    ft = { "python" },
  },

  {
    "tpope/vim-repeat",
    event = "CursorMoved",
  },

  {
    "ggandor/lightspeed.nvim",
    event = "CursorMoved",
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    dependencies = {
      "neoscroll.nvim",
    },
    config = function()
      require("nvim-surround").setup { keymaps = { visual = "gs" } }
    end,
  },

  -- {
  --   "SmiteshP/nvim-navic",
  --   module = "nvim-navic",
  --   config = function()
  --     require("nvim-navic").setup {
  --       highlight = true,
  --     }
  --   end,
  -- },

  {
    "andymass/vim-matchup",
    lazy = false,
    dependencies = {
      "vim-repeat",
    },
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
}
