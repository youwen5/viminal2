-- [nfnl] ./fnl/plugins/obsidian.fnl
local function get_workspaces()
  local all_workspaces = {{name = "vault", path = vim.fs.normalize("~/Documents/vaults/vault")}, {name = "alexandria", path = vim.fs.normalize("~/Documents/alexandria/content")}}
  local existing_workspaces = {}
  for i, x in ipairs(all_workspaces) do
    if (vim.fn.isdirectory(x.path) == 1) then
      table.insert(existing_workspaces, all_workspaces[i])
      vim.notify(("Detected Obsidian workspace " .. x.path .. ", adding " .. vim.inspect(all_workspaces[i]) .. " to obsidian workspaces"), vim.log.levels.DEBUG)
    else
    end
  end
  return existing_workspaces
end
local function _2_()
  local workspaces = get_workspaces()
  if (#workspaces > 0) then
    local opts = {completion = {nvim_cmp = false}, ui = {enable = false}, workspaces = workspaces}
    return require("obsidian").setup(opts)
  else
    return nil
  end
end
return {"obsidian.nvim", after = _2_, ft = {"markdown"}}
