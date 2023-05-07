local autocmd = vim.api.nvim_create_autocmd

-- Ibus typing
local ibus_cur = "xkb:us::eng"
autocmd("InsertEnter", {
  pattern = { "*" },
  callback = function()
    os.execute("ibus engine " .. ibus_cur)
  end,
})

autocmd("InsertLeave", {
  pattern = { "*" },
  callback = function()
    local f = io.popen("ibus engine", "r")
    if f then
      ibus_cur = f:read "*a"
      f:close()
    end
    os.execute "ibus engine xkb:us::eng"
  end,
})

---@param padding_amount integer
---@param margin_amount integer
local set_spacing = function(padding_amount, margin_amount)
  -- locar command = string.format('kitty @ set-spacing padding=%d margin=%d', padding_amount, margin_amount)
  vim.fn.system({
    "kitty",
    "@", "set-spacing",
    "padding=" .. padding_amount,
    "margin=" .. margin_amount,
  })
end

set_spacing(0, 0)

vim.api.nvim_create_autocmd("VimLeave", {
  once = true,
  callback = function()
    set_spacing(0, 20)
  end
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
