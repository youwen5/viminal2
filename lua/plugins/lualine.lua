-- [nfnl] ./fnl/plugins/lualine.fnl
local function _1_()
  local function _2_()
    require("lz.n").trigger_load("lsp-progress")
    return require("lsp-progress").progress()
  end
  local function _3_()
    local ok, pomo = pcall(require, "pomo")
    if not ok then
      return ""
    else
    end
    local timer = pomo.get_first_to_finish()
    if (timer == nil) then
      return ""
    else
    end
    return ("\243\176\132\137 " .. tostring(timer))
  end
  require("lualine").setup({extensions = {}, inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {"filename"}, lualine_x = {"location"}, lualine_y = {}, lualine_z = {}}, inactive_winbar = {}, options = {always_divide_middle = true, component_separators = {left = "\238\130\177", right = "\238\130\179"}, disabled_filetypes = {statusline = {"ministarter"}, winbar = {}}, globalstatus = true, icons_enabled = true, ignore_focus = {}, refresh = {statusline = 1000, tabline = 1000, winbar = 1000}, section_separators = {left = "\238\130\180", right = "\238\130\182"}, theme = "auto"}, sections = {lualine_a = {"branch"}, lualine_b = {"filetype"}, lualine_c = {"progress", _2_}, lualine_x = {_3_, "encoding", "fileformat"}, lualine_y = {"diff", "diagnostics"}, lualine_z = {"location"}}, tabline = {}, winbar = {}})
  vim.api.nvim_create_augroup("lualine_augroup", {clear = true})
  return vim.api.nvim_create_autocmd("User", {callback = require("lualine").refresh, group = "lualine_augroup", pattern = "LspProgressStatusUpdated"})
end
return {"lualine.nvim", after = _1_}
