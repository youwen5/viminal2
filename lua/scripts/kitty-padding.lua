-- [nfnl] ./fnl/scripts/kitty-padding.fnl
local M = {}
local ___fn___ = vim.fn
local api = vim.api
local autocmd = api.nvim_create_autocmd
local autogroup = api.nvim_create_augroup
local function no_padding(sync)
  local command = "kitty @ set-spacing padding-h=0 padding-bottom=0"
  if not sync then
    local function _1_(_, d, _0)
      if (#d > 1) then
        return vim.notify("Error setting window padding. Make sure kitty remote control is turned on.", vim.log.levels.DEBUG)
      else
        return nil
      end
    end
    return ___fn___.jobstart(command, {on_stderr = _1_})
  else
    return ___fn___.system(command)
  end
end
local function restore_padding(sync)
  local command = "kitty @ set-spacing padding=default"
  if not sync then
    local function _4_(_, d, _0)
      if (#d > 1) then
        return vim.notify("Error setting window padding. Make sure kitty remote control is turned on.", vim.log.levels.DEBUG)
      else
        return nil
      end
    end
    return ___fn___.jobstart(command, {on_stderr = _4_})
  else
    return ___fn___.system(command)
  end
end
M.setup = function()
  local function _7_()
    return no_padding()
  end
  autocmd({"VimResume", "VimEnter"}, {callback = _7_, group = autogroup("SpacingRemove", {clear = true}), pattern = "*"})
  local function _8_()
    return restore_padding(true)
  end
  return autocmd({"VimLeavePre", "VimSuspend"}, {callback = _8_, group = autogroup("SpacingRestore", {clear = true})})
end
return M
