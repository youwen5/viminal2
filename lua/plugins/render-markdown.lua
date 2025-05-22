-- [nfnl] ./fnl/plugins/render-markdown.fnl
local function _1_()
  return require("render-markdown").setup({file_types = {"markdown"}})
end
return {"render-markdown.nvim", after = _1_}
