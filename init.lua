-- [nfnl] Compiled from ./init.fnl by https://github.com/Olical/nfnl, do not edit.
if (os.getenv("TERM") == "xterm-kitty") then
  require("scripts.chameleon").setup()
  require("scripts.kitty-padding").setup()
else
end
require("keymaps")
require("plugins")
require("scripts.obsidian-sync")
require("scripts.autoroot").setup()
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.laststatus = 3
vim.opt.undofile = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.treesitter.indent = true
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldenable = false
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.list = true
vim.opt.listchars = {nbsp = "\226\144\163", tab = "\194\187 ", trail = "\194\183"}
vim.opt.scrolloff = 10
vim.cmd.colorscheme("oxocarbon")
vim.g.node_host_prog = nixCats("bin.neovim-node-host")
vim.g.loaded_node_provider = nil
local function _2_(_, buf)
  local max_filesize = (100 * 1024)
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ((ok and stats) and (stats.size > max_filesize)) then
    return true
  else
    return nil
  end
end
require("nvim-treesitter.configs").setup({disable = _2_, ensure_installed = {}, highlight = {enable = true}, ignore_install = {}, incremental_selection = {enable = true, keymaps = {init_selection = "<CR>", node_decremental = "<C-j>", node_incremental = "<C-k>", scope_incremental = "<BS>"}}, modules = {"highlight", "incremental_selection", "indent"}, additional_vim_regex_highlighting = false, auto_install = false, sync_install = false})
local function _4_()
  return vim.cmd("setlocal nonumber norelativenumber")
end
vim.api.nvim_create_autocmd({"TermOpen"}, {callback = _4_, group = vim.api.nvim_create_augroup("terminal", {})})
local function _5_()
  return vim.highlight.on_yank({higroup = "Visual", timeout = 300})
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _5_})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {silent = true})
local function _6_()
  local current_tab = vim.api.nvim_get_current_tabpage()
  vim.cmd("tabdo wincmd =")
  return vim.api.nvim_set_current_tabpage(current_tab)
end
return vim.api.nvim_create_autocmd({"VimResized"}, {callback = _6_, desc = "Resize splits with terminal window", group = vim.api.nvim_create_augroup("EqualizeSplits", {})})
