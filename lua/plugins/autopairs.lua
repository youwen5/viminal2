-- [nfnl] ./fnl/plugins/autopairs.fnl
local function _1_()
  return require("nvim-autopairs").setup()
end
return {"nvim-autopairs", after = _1_, event = "BufEnter"}
