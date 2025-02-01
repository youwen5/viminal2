-- [nfnl] Compiled from ./fnl/plugins/harpoon.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("harpoon"):setup()
end
local function _2_()
  return require("harpoon"):list():add()
end
local function _3_()
  return require("harpoon"):list():select(1)
end
local function _4_()
  return require("harpoon"):list():select(2)
end
local function _5_()
  return require("harpoon"):list():select(3)
end
local function _6_()
  return require("harpoon"):list():select(4)
end
local function _7_()
  require("lz.n").trigger_load("telescope.nvim")
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end
    return require("telescope.pickers").new({}, {finder = require("telescope.finders").new_table({results = file_paths}), previewer = conf.file_previewer({}), prompt_title = "Harpoon", sorter = conf.generic_sorter({})}):find()
  end
  return toggle_telescope(require("harpoon"):list())
end
return {"harpoon2", after = _1_, keys = {{"<leader>a", _2_, desc = "Add to harpoon", mode = "n"}, {"<C-h><C-a>", _3_, desc = "Select harpoon 1", mode = "n"}, {"<C-h><C-s>", _4_, desc = "Select harpoon 2", mode = "n"}, {"<C-h><C-d>", _5_, desc = "Select harpoon 3", mode = "n"}, {"<C-h><C-f>", _6_, desc = "Select harpoon 4", mode = "n"}, {"<C-h><C-h>", _7_, desc = "toggle harpoon menu", mode = "n"}}}
