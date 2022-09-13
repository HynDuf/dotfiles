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

-- Dynamic terminal padding with/without nvim - credit: siduck
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

autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.cmd(string.format "silent !ulimit -s unlimited")
  end,
})

autocmd("BufRead", {
  pattern = { "*.inp", "*.out" },
  callback = function()
    vim.cmd(string.format "setlocal nonumber")
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
vim.g.lightspeed_last_motion = ""

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

vim.keymap.set(
  "n",
  ";",
  [[g:lightspeed_last_motion == 'sx' ? "<Plug>Lightspeed_;_sx" : "<Plug>Lightspeed_;_ft"]],
  { expr = true }
)
vim.keymap.set(
  "n",
  ",",
  [[g:lightspeed_last_motion == 'sx' ? "<Plug>Lightspeed_,_sx" : "<Plug>Lightspeed_,_ft"]],
  { expr = true }
)
