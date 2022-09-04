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

-- Dynamic terminal padding with/without nvim
-- replace stuff from file
local function sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
end

-- reloads xresources for current focused window only
local function liveReload_xresources()
  vim.cmd(
    string.format "silent !xrdb merge ~/.Xresources && kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"
  )
end

autocmd({ "BufNewFile", "BufRead" }, {
  callback = function(ctx)
    -- remove terminal padding
    sed("st.borderpx: 25", "st.borderpx: 0", "~/.Xresources")
    liveReload_xresources()

    -- revert xresources change but dont reload it
    sed("st.borderpx: 0", "st.borderpx: 25", "~/.Xresources")
    vim.cmd(string.format "silent !xrdb merge ~/.Xresources")
    vim.api.nvim_del_autocmd(ctx.id)
  end,
})

-- add terminal padding
autocmd("VimLeavePre", {
  callback = function()
    sed("st.borderpx: 0", "st.borderpx: 25", "~/.Xresources")
    vim.cmd(string.format "silent !xrdb merge ~/.Xresources")
  end,
})
