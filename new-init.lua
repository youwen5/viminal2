-- [nfnl] Compiled from ./new-init.fnl by https://github.com/Olical/nfnl, do not edit.
if os.getenv("TERM") then
  return require("scripts.chameleon").setup(require("scripts.kitty-padding").setup)
else
  return {}
end
