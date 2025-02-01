-- [nfnl] Compiled from ./fnl/plugins/by-lang/latex.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  require("texpresso")["texpresso_path"] = nixCats("bin.texpresso")
  return nil
end
return {"texpresso.vim", after = _1_, cmd = {"TeXpresso"}, filetypes = {"*.tex"}}
