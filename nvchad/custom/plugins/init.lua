-- custom/plugins/init.lua

return {

   ["goolord/alpha-nvim"] = {
      config = function()
         require("alpha").setup(require("alpha.themes.theta").config)
      end,
      disable = false,
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
         require("custom.plugins.configs.null-ls").setup()
      end,
   },

   ["hrsh7th/nvim-cmp"] = {
      after = "friendly-snippets",
      config = function()
         require "custom.plugins.configs.cmp"
      end,
   },
}
