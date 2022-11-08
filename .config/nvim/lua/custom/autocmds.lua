local autocmd = vim.api.nvim_create_autocmd
-- Ibus typing
local ibus_cur = "xkb:us::eng"
autocmd("InsertEnter", {
  pattern = { "*.tex", "*.md", "*.txt" },
  callback = function()
    os.execute("ibus engine " .. ibus_cur)
  end,
})

autocmd("InsertLeave", {
  pattern = { "*.tex", "*.md", "*.txt" },
  callback = function()
    local f = io.popen("ibus engine", "r")
    if f then
      ibus_cur = f:read "*a"
      f:close()
    end
    os.execute "ibus engine xkb:us::eng"
  end,
})

-- Dynamic terminal padding with/without nvim - credit: siduck
-- replace stuff from file
local function sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
end

-- reloads kitty for current focused window only
local function liveReloadKitty()
  vim.cmd(([[silent !kill -s SIGUSR1 %s]]):format(vim.g.window_id))
end

autocmd({ "BufNewFile", "BufRead" }, {
  callback = function(ctx)
    -- remove terminal padding
    sed("window_margin_width 20", "window_margin_width 0", "~/.config/kitty/kitty.conf")
    liveReloadKitty()
    -- revert kitty margin width change but dont reload it
    sed("window_margin_width 0", "window_margin_width 20", "~/.config/kitty/kitty.conf")
    vim.api.nvim_del_autocmd(ctx.id)
  end,
})

-- add terminal padding
autocmd("VimLeavePre", {
  callback = function()
    sed("window_margin_width 0", "window_margin_width 20", "~/.config/kitty/kitty.conf")
    liveReloadKitty()
  end,
})

-- auto reload buffer when changed
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.api.nvim_get_mode() ~= "c" then
      vim.cmd "checktime"
    end
  end,
})

autocmd("FileChangedShellPost", {
  callback = function()
    vim.cmd(([[echohl WarningMsg | echomsg "%s" | echohl None]]):format "File changed on disk. Buffer reloaded.")
  end,
})

autocmd("BufRead", {
  pattern = { "*.inp", "*.out" },
  callback = function()
    vim.cmd(string.format "setlocal nornu")
  end,
})

autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
  end,
})

-- setting `;` (forward) and `,` (backward) to repeat the last Lightspeed motion (s/x or f/t):
local last_motion = vim.api.nvim_create_augroup("LightSpeedLastMotion", { clear = true })

vim.api.nvim_create_autocmd("User", {
  pattern = "LightspeedSxEnter",
  group = last_motion,
  callback = function()
    vim.g.lightspeed_last_motion = "sx"
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LightspeedFtEnter",
  group = last_motion,
  callback = function()
    vim.g.lightspeed_last_motion = "ft"
  end,
})

vim.keymap.set("n", ";", function()
  return (vim.g.lightspeed_last_motion == "sx" and "<Plug>Lightspeed_;_sx" or "<Plug>Lightspeed_;_ft")
end, { expr = true })
vim.keymap.set("n", ",", function()
  return (vim.g.lightspeed_last_motion == "sx" and "<Plug>Lightspeed_,_sx" or "<Plug>Lightspeed_,_ft")
end, { expr = true })
