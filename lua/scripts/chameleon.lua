-- [nfnl] Compiled from ./fnl/scripts/chameleon.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {}
local ___fn___ = vim.fn
local api = vim.api
M.original_color = nil
local function get_kitty_background()
  if (M.original_color == nil) then
    local function _1_(_, d, _0)
      if (#d > 1) then
        return vim.notify("Chameleon.nvim: Error getting background. Make sure kitty remote control is turned on.", vim.log.levels.DEBUG)
      else
        return nil
      end
    end
    local function _3_(_, d, _0)
      for _1, result in ipairs(d) do
        if string.match(result, "^background") then
          local color = vim.split(result, "%s+")[2]
          M.original_color = color
          break
        else
        end
      end
      return nil
    end
    return ___fn___.jobstart({"kitty", "@", "get-colors"}, {on_stderr = _1_, on_stdout = _3_})
  else
    return nil
  end
end
local function change_background(color, sync)
  local arg = ("background=\"" .. color .. "\"")
  local command = ("kitty @ set-colors " .. arg)
  if not sync then
    local function _6_(_, d, _0)
      if (#d > 1) then
        return vim.notify("Chameleon.nvim: Error changing background. Make sure kitty remote control is turned on.", vim.log.levels.DEBUG)
      else
        return nil
      end
    end
    return ___fn___.jobstart(command, {on_stderr = _6_})
  else
    return ___fn___.system(command)
  end
end
local function setup_autocmds()
  local autocmd = api.nvim_create_autocmd
  local autogroup = api.nvim_create_augroup
  local bg_change = autogroup("BackgroundChange", {clear = true})
  local function _9_()
    local color = string.format("#%06X", vim.api.nvim_get_hl(0, {name = "Normal"}).bg)
    return change_background(color)
  end
  autocmd({"ColorScheme", "VimResume"}, {callback = _9_, group = bg_change, pattern = "*"})
  local function _10_()
    local color = string.format("#%06X", vim.api.nvim_get_hl(0, {name = "Normal"}).bg)
    return change_background(color)
  end
  autocmd("User", {callback = _10_, group = bg_change, pattern = "NvChadThemeReload"})
  local function _11_()
    if (M.original_color ~= nil) then
      return change_background(M.original_color, true)
    else
      return nil
    end
  end
  return autocmd({"VimLeavePre", "VimSuspend"}, {callback = _11_, group = autogroup("BackgroundRestore", {clear = true})})
end
M.setup = function()
  get_kitty_background()
  return setup_autocmds()
end
return M
