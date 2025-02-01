-- [nfnl] Compiled from ./fnl/plugins/conform.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local function _2_(bufnr)
    if (vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat) then
      return 
    else
    end
    return {lsp_fallback = true, timeout_ms = 500}
  end
  require("conform").setup({default_format_opts = {lsp_format = "fallback"}, format_on_save = _2_, formatters_by_ft = {c = {"clang-format", lsp_format = "fallback"}, cpp = {"clang-format", lsp_format = "fallback"}, fennel = {"fnlfmt", lsp_format = "fallback"}, haskell = {"fourmolu", "ormolu", stop_after_first = true}, javascript = {"prettierd", "prettier", stop_after_first = true}, json = {"prettierd", "prettier", stop_after_first = true}, jsonc = {"prettierd", "prettier", stop_after_first = true}, jypescriptreact = {"prettierd", "prettier", stop_after_first = true}, lua = {"stylua"}, nix = {"nixfmt"}, python = {"black"}, rust = {"rustfmt", lsp_format = "fallback"}, svelte = {"prettier", lsp_format = "fallback"}, tex = {"latexindent"}, toml = {"taplo", stop_after_first = true}, typescript = {"prettierd", "prettier", stop_after_first = true}, typescriptreact = {"prettierd", "prettier", stop_after_first = true}, typst = {"typstyle"}, yaml = {"prettierd", "prettier", stop_after_first = true}}})
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  return nil
end
local function _4_()
  return require("conform").format({async = true})
end
local function _5_()
  if vim.g.disable_autoformat then
    vim.g.disable_autoformat = false
    return nil
  else
    vim.g.disable_autoformat = true
    return nil
  end
end
local function _7_()
  if vim.b[0].disable_autoformat then
    vim.b[0]["disable_autoformat"] = false
    return nil
  else
    vim.b[0]["disable_autoformat"] = true
    return nil
  end
end
return {"conform.nvim", after = _1_, cmd = "ConformInfo", event = "BufWritePre", keys = {{"<leader>cf", _4_, desc = "Format code", mode = {"n", "v"}}, {"<leader>ctf", _5_, desc = "Disable autoformat on save globally", mode = {"n", "v"}}, {"<leader>cbf", _7_, desc = "Disable autoformat on save buffer", mode = {"n", "v"}}}}
