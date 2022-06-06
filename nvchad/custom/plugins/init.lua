-- custom/plugins/init.lua

return {
    ["goolord/alpha-nvim"] = {
      disable = false,
      config = function ()
        require'alpha'.setup(require'alpha.themes.theta'.config)
      end,
    },

   ["karb94/neoscroll.nvim"] = {
      config = function()
         require("neoscroll").setup()
      end,

      -- lazy loading
      setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
      end,
   },

   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require ("custom.plugins.configs.null-ls").setup()
      end,
      -- lazy loading
      setup = function()
         require("core.utils").packer_lazy_load "null-ls.nvim"
      end,
   },

  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
       "TZAtaraxis",
       "TZMinimalist",
       "TZFocus",
    },
    config = function()
       require "custom.plugins.configs.truezen"
    end,
  },

  ["nvim-neorg/neorg"] = {
    ft = "norg",
    after = "nvim-treesitter",
    config = function()
       require "custom.plugins.configs.neorg"
    end,
  },

   ["hrsh7th/nvim-cmp"] = {
      after = "friendly-snippets",
      config = function()
         require "custom.plugins.configs.cmp"
      end,
   },

   ["jghauser/mkdir.nvim"] = {

   },
}
