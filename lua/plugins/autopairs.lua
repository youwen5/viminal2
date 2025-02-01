-- [nfnl] Compiled from ./fnl/plugins/autopairs.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("nvim-autopairs").setup()
end
return {"nvim-autopairs", after = _1_, event = "BufEnter"}
