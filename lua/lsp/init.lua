-- [nfnl] Compiled from ./fnl/lsp/init.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local symbols = {Error = "\243\176\133\153", Info = "\243\176\139\188", Hint = "\243\176\140\181", Warn = "\239\129\177"}
  for name, icon in pairs(symbols) do
    local hl = ("DiagnosticSign" .. name)
    vim.fn.sign_define(hl, {text = icon, numhl = hl, texthl = hl})
  end
  do
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({settings = {Lua = {runtime = {version = "LuaJIT"}, diagnostics = {globals = {"nixCats"}}, telemetry = {enable = false}}}})
    lspconfig.nixd.setup({})
    lspconfig.marksman.setup({})
    lspconfig.tinymist.setup({offset_encoding = "utf-8"})
    lspconfig.svelte.setup({})
    lspconfig.texlab.setup({})
    lspconfig.clangd.setup({})
    lspconfig.mesonlsp.setup({})
    lspconfig.nushell.setup({})
    lspconfig.harper_ls.setup({})
    lspconfig.fennel_ls.setup({})
    lspconfig.elmls.setup({})
    lspconfig.purescriptls.setup({command = "purescript-language-server", args = {"stdio", "--config {}"}, filetypes = {"purescript"}, rootPatterns = {"bower.json", "psc-package.json", "spago.dhall"}})
  end
  return {}
end
return {setup = _1_}
