-- custom/plugins/init.lua
local lazy = function(plugin, timer)
  if plugin then
    timer = timer or 0
    vim.defer_fn(function()
      require("packer").loader(plugin)
    end, timer)
  end
end
return {
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function ()
      require'alpha'.setup(require'alpha.themes.theta'.config)
    end,
  },

  ["karb94/neoscroll.nvim"] = {
    event = "CursorMoved",
    config = function()
      require("neoscroll").setup()
    end,

    -- lazy loading
    -- setup = function()
    --   require("core.lazy_load").packer_lazy_load "neoscroll.nvim"
    -- end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require ("custom.plugins.configs.null-ls").setup()
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

  -- ["hrsh7th/nvim-cmp"] = {
  --   after = "friendly-snippets",
  --   config = function()
  --       require "custom.plugins.configs.cmp"
  --   end,
  -- },

  ["jghauser/mkdir.nvim"] = {
    after = "nvim-treesitter",
  },

  ["max397574/better-escape.nvim"] = {
    event = "InsertCharPre",
    config = function()
      require("custom.plugins.configs.better_escape")
    end,
  },

  ["lervag/vimtex"] = {
    opt = true,
    config = function()
      require "custom.plugins.configs.vimtex"
    end,

    setup = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "tex", "plaintex" },
        callback = function()
          lazy "vimtex"
        end,
      })
    end,
  }
}
