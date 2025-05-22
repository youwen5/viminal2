-- [nfnl] ./fnl/plugins/oil.fnl
local function _1_()
  return require("oil").setup({columns = {"size", "icon"}, keymaps = {["<C-h>"] = "actions.select_split", ["<C-l>"] = "actions.refresh", ["<C-p>"] = "actions.preview", ["<C-s>"] = "actions.select_vsplit", ["<C-t>"] = "actions.select_tab", ["<CR>"] = "actions.select", J = "actions.parent", K = "actions.select", Q = "actions.close", _ = "actions.open_cwd", ["`"] = "actions.cd", ["g."] = "actions.toggle_hidden", ["g?"] = "actions.show_help", ["g\\"] = "actions.toggle_trash", gs = "actions.change_sort", gx = "actions.open_external", ["~"] = "actions.tcd"}, default_file_explorer = false, use_default_keymaps = false})
end
local function _2_()
  return vim.cmd(("Oil " .. vim.fn.getcwd()))
end
return {"oil.nvim", after = _1_, cmd = "Oil", keys = {{"<leader>bf", _2_, desc = "Open oil in current working directory", mode = "n"}, {"<leader>be", vim.cmd.Oil, desc = "Open oil in current file directory", mode = "n"}}}
