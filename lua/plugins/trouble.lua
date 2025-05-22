-- [nfnl] ./fnl/plugins/trouble.fnl
local function _1_()
  return require("trouble").setup()
end
local function _2_()
  return vim.cmd("Trouble diagnostics toggle")
end
local function _3_()
  return vim.cmd("Trouble diagnostics toggle filter.buf=0")
end
local function _4_()
  return vim.cmd("Trouble symbols toggle")
end
local function _5_()
  return vim.cmd("Trouble lsp toggle win.position=right")
end
local function _6_()
  return vim.cmd("Trouble qflist toggle")
end
return {"trouble.nvim", after = _1_, cmd = "Trouble", keys = {{"<leader>xx", _2_, desc = "Diagnostics", mode = "n"}, {"<leader>xX", _3_, desc = "Buffer diagnostics", mode = "n"}, {"<leader>cs", _4_, desc = "Symbols", mode = "n"}, {"<leader>cl", _5_, desc = "LSP definitions / references /...", mode = "n"}, {"<leader>ql", _6_, desc = "Quickfix list (trouble)", mode = "n"}}}
