-- [nfnl] Compiled from ./fnl/plugins/toggleterm.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("toggleterm").setup({shade_terminals = false})
end
local function _2_()
  return vim.cmd("ToggleTerm direction=float")
end
local function _3_()
  return vim.cmd("ToggleTerm direction=vertical")
end
local function _4_()
  return vim.cmd("ToggleTerm direction=horizontal")
end
local function _5_()
  return vim.cmd("TermSelect")
end
return {"toggleterm.nvim", after = _1_, keys = {{"<C-l>", _2_, desc = "Toggle terminal", mode = {"n", "t", "v"}}, {"<leader>tv", _3_, desc = "Vertical terminal", mode = "n"}, {"<leader>tt", _4_, desc = "Horizontal terminal", mode = "n"}, {"<leader>ts", _5_, desc = "Terminal select", mode = "n"}}}
