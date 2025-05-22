-- [nfnl] ./fnl/plugins/neogit.fnl
local function _1_()
  local function graph_style()
    if (os.getenv("TERM") == "xterm-kitty") then
      return "kitty"
    else
      return "ascii"
    end
  end
  return require("neogit").setup({graph_style = graph_style(), integrations = {telescope = true}, kind = "replace"})
end
local function _3_()
  local lz = require("lz.n")
  return lz.trigger_load("telescope.nvim")
end
local function _4_()
  return vim.cmd.Neogit()
end
local function _5_()
  return vim.cmd.Neogit("kind=floating commit")
end
return {"neogit", after = _1_, before = _3_, cmd = "Neogit", keys = {{"<leader>gg", _4_, desc = "Open neogit", mode = "n"}, {"<leader>gc", _5_, desc = "Open neogit commit menu", mode = "n"}}}
