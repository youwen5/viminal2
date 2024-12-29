return {
  "neogit",
  cmd = "Neogit",
  keys = {
    {
      "<leader>gg",
      function()
        vim.cmd.Neogit()
      end,
      desc = "Open neogit",
      mode = "n",
    },
    {
      "<leader>gc",
      function()
        vim.cmd.Neogit("kind=floating commit")
      end,
      desc = "Open neogit commit menu",
      mode = "n",
    },
  },
  before = function()
    local lz = require("lz.n")
    lz.trigger_load("telescope.nvim")
  end,
  after = function()
    local function graph_style()
      if os.getenv("TERM") == "xterm-kitty" then
        return "kitty"
      else
        return "ascii"
      end
    end
    require("neogit").setup({
      graph_style = graph_style(),
      integrations = {
        telescope = true,
      },
      kind = "replace",
    })
  end,
}
