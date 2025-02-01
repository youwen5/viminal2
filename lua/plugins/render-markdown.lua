-- [nfnl] Compiled from ./fnl/plugins/render-markdown.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("render-markdown").setup({file_types = {"markdown"}})
end
return {"render-markdown.nvim", after = _1_}
