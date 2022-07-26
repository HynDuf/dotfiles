local autocmd = vim.api.nvim_create_autocmd
-- Ibus typing
local ibus_cur = "xkb:us::eng"
autocmd("InsertEnter", {
  pattern = { "*.tex", "*.md" },
  callback = function()
    os.execute("ibus engine " .. ibus_cur)
  end,
})

autocmd("InsertLeave", {
  pattern = { "*.tex", "*.md" },
  callback = function()
    local f = io.popen("ibus engine", "r")
    if f then
      ibus_cur = f:read "*a"
      f:close()
    end
    os.execute "ibus engine xkb:us::eng"
  end,
})
