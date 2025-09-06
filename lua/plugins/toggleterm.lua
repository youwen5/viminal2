return {
  "toggleterm.nvim",
  keys = {
    {
      "<C-s>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "float", count = 1 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal",
    },
    {
      "<C-1>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "float", count = 1 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal 1",
    },
    {
      "<C-2>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "float", count = 2 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal 2",
    },
    {
      "<C-3>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "float", count = 3 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal 3",
    },
    {
      "<C-4>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "float", count = 3 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal 3",
    },
    {
      "<C-5>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "horizontal", count = 5 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal 5",
    },
    {
      "<C-6>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "horizontal", count = 6 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal 6",
    },
    {
      "<C-7>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "horizontal", count = 7 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal 7",
    },
    {
      "<C-8>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "vertical", count = 8 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal 8",
    },
    {
      "<C-9>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "vertical", count = 9 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal 9",
    },
    {
      "<C-0>",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "vertical", count = 10 }):toggle()
      end,
      mode = { "n", "t", "v" },
      desc = "Toggle terminal 10",
    },
    {
      "<C-j>",
      function()
        require("toggleterm.terminal").Terminal
          :new({
            direction = "horizontal",
            count = 100,
            cmd = "just",
            display_name = "just runner",
            auto_scroll = true,
            close_on_exit = true,
          })
          :toggle()
      end,
      mode = "n",
      desc = "Toggle a floating terminal and run `just`",
    },
    {
      "<leader>ts",
      function()
        vim.cmd("TermSelect")
      end,
      desc = "Terminal select",
      mode = "n",
    },
  },
  after = function()
    require("toggleterm").setup({
      shade_terminals = false,
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    })
  end,
}
