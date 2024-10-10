require("plugins")

vim.opt.relativenumber = true
vim.opt.number = true

-- Global statusline
vim.opt.laststatus = 3
-- Persistent undos across session
vim.opt.undofile = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 2

vim.treesitter.indent = true
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldenable = false

vim.cmd("colorscheme rose-pine")
