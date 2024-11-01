-- remove padding from kitty terminal when entering vim

local M = {}

local fn = vim.fn
local api = vim.api

local autocmd = api.nvim_create_autocmd
local autogroup = api.nvim_create_augroup

local no_padding = function(sync)
  local command = "kitty @ set-spacing padding-h=0 padding-bottom=0"
  if not sync then
    fn.jobstart(command, {
      on_stderr = function(_, d, _)
        if #d > 1 then
          api.nvim_err_writeln("Error setting window padding. Make sure kitty remote control is turned on.")
        end
      end,
    })
  else
    fn.system(command)
  end
end

local restore_padding = function(sync)
  local command = "kitty @ set-spacing padding=default"
  if not sync then
    fn.jobstart(command, {
      on_stderr = function(_, d, _)
        if #d > 1 then
          api.nvim_err_writeln("Error setting window padding. Make sure kitty remote control is turned on.")
        end
      end,
    })
  else
    fn.system(command)
  end
end

M.setup = function()
  autocmd({ "VimResume", "VimEnter" }, {
    pattern = "*",
    callback = function()
      no_padding()
    end,
    group = autogroup("SpacingRemove", { clear = true }),
  })

  autocmd({ "VimLeavePre", "VimSuspend" }, {
    callback = function()
      restore_padding(true)
    end,
    group = autogroup("SpacingRestore", { clear = true }),
  })
end

return M
