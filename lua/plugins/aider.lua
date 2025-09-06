return {
  "nvim-aider",
  cmd = "Aider",
  keys = {
    {
      "<leader>a<space>",
      function()
        vim.cmd.Aider("toggle")
      end,
      desc = "Toggle Aider",
    },
    {
      "<leader>as",
      function()
        vim.cmd.Aider("send")
      end,
      desc = "Send to Aider",
      mode = { "n", "v" },
    },
    {
      "<leader>ac",
      function()
        vim.cmd.Aider("command")
      end,
      desc = "Aider Commands",
    },
    {
      "<leader>ab",
      function()
        vim.cmd.Aider("buffer")
      end,
      desc = "Send Buffer",
    },
    {
      "<leader>a+",
      function()
        vim.cmd.Aider("add")
      end,
      desc = "Add File",
    },
    {
      "<leader>a-",
      function()
        vim.cmd.Aider("drop")
      end,
      desc = "Drop File",
    },
    {
      "<leader>ar",
      function()
        vim.cmd.Aider("add readonly")
      end,
      desc = "Add Read-Only",
    },
    {
      "<leader>aR",
      function()
        vim.cmd.Aider("reset")
      end,
      desc = "Reset Session",
    },
  },
  after = function()
    require("nvim_aider").setup({
      -- Command line arguments passed to aider
      args = {
        "--no-auto-commits",
        "--pretty",
        "--stream",
      },
      -- Automatically reload buffers changed by Aider (requires vim.o.autoread = true)
      auto_reload = true,
    })
  end,
}
