-- [nfnl] ./fnl/plugins/by-lang/latex.fnl
local function _1_()
  require("texpresso")["texpresso_path"] = nixCats("bin.texpresso")
  return nil
end
return {"texpresso.vim", after = _1_, cmd = {"TeXpresso"}, filetypes = {"*.tex"}}
