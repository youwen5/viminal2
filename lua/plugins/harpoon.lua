return {
  "harpoon2",
  after = function()
    local harpoon = require("harpoon")

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<C-h><C-a>", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<C-h><C-s>", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<C-h><C-d>", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<C-h><C-f>", function()
      harpoon:list():select(4)
    end)

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    vim.keymap.set("n", "<C-h><C-h>", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
  end,
}
