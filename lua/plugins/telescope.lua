-- [nfnl] ./fnl/plugins/telescope.fnl
local function _1_()
  require("telescope").setup({extensions = {["ui-select"] = {require("telescope.themes").get_dropdown({})}}})
  require("telescope").load_extension("fzf")
  return require("telescope").load_extension("ui-select")
end
local function _2_()
  local builtin = require("telescope.builtin")
  local is_git = vim.fn.finddir(".git", (vim.fn.getcwd() .. ";"))
  if is_git then
    return builtin.git_files()
  else
    return builtin.find_files()
  end
end
local function _4_()
  return require("telescope.builtin").find_files()
end
local function _5_()
  return require("telescope.builtin").live_grep()
end
local function _6_()
  return require("telescope.builtin").buffers()
end
local function _7_()
  return require("telescope.builtin").lsp_definitions()
end
local function _8_()
  return require("telescope.builtin").lsp_implementations()
end
local function _9_()
  return require("telescope.builtin").lsp_document_symbols()
end
local function _10_()
  return require("telescope.builtin").lsp_workspace_symbols()
end
local function _11_()
  return require("telescope.builtin").diagnostics()
end
return {"telescope.nvim", after = _1_, keys = {{"<leader> ", _2_, desc = "Grep through all files tracked by git, or fall back to just cwd", mode = "n"}, {"<leader>ff", _4_, desc = "Grep through all files in cwd", mode = "n"}, {"<leader>ca", vim.lsp.buf.code_action, desc = "LSP Code Action", mode = "n"}, {"<leader>/", _5_, desc = "Live grep", mode = "n"}, {"<leader>k", _6_, desc = "List buffers", mode = "n"}, {"gd", _7_, desc = "Go to LSP definition", mode = "n"}, {"gi", _8_, desc = "Go to implementations", mode = "n"}, {"<leader>j", _9_, desc = "Search through document symbols", mode = "n"}, {"<leader>fs", _10_, desc = "Search through entire workspace symbols", mode = "n"}, {"<leader>fd", _11_, desc = "Search through LSP diagnostics", mode = "n"}}}
