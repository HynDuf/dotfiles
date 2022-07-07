-- custom/plugins/init.lua
-- local lazy = function(plugin, timer)
--   if plugin then
--     timer = timer or 0
--     vim.defer_fn(function()
--       require("packer").loader(plugin)
--     end, timer)
--   end
-- end
return {
    ["goolord/alpha-nvim"] = {
        disable = false,
        config = function()
            require'alpha'.setup(require'alpha.themes.theta'.config)
        end
    },

    ["karb94/neoscroll.nvim"] = {
        event = "CursorMoved",
        config = function() require("neoscroll").setup() end

    },

    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
            require("custom.plugins.configs.null-ls").setup()
        end
    },

    ["jghauser/mkdir.nvim"] = {after = "nvim-treesitter"}
}
