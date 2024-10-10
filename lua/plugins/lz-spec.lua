return {
  require("plugins.blink-cmp"),
  require("plugins.telescope"),
  require("plugins.oil"),
  require("plugins.harpoon"),
  require("plugins.lualine"),
  require("plugins.conform"),
  require("plugins.lsp-progress"),
  require("plugins.gitsigns"),
  require("plugins.autopairs"),
  { "telescope-ui-select.nvim", priority = 70 },
  {
    "nvim-lspconfig",
    event = "BufEnter",
    after = function()
      require("lsp")
    end,
  },
  {
    "sleuth",
    event = "BufEnter",
  },
  {
    "which-key.nvim",
    after = function()
      require("which-key").setup({
        delay = 1000,
      })
    end,
  },
  { "nvim-web-devicons" },
  { "rose-pine" },
  { "render-markdown.nvim" },
  { "markdown-preview.nvim" },
  {
    "trouble.nvim",
    event = "LspAttach",
    after = function()
      require("trouble").setup()
      vim.keymap.set("n", "<leader>xx", function()
        vim.cmd("Trouble diagnostics toggle")
      end, { desc = "Diagnostics" })
      vim.keymap.set("n", "<leader>xX", function()
        vim.cmd("Trouble diagnostics toggle filter.buf=0")
      end, { desc = "Buffer diagnostics" })
      vim.keymap.set("n", "<leader>cs", function()
        vim.cmd("Trouble symbols toggle")
      end, { desc = "Symbols" })
      vim.keymap.set("n", "<leader>cl", function()
        vim.cmd("Trouble lsp toggle win.position=right")
      end, { desc = "LSP definitions / references /..." })
      vim.keymap.set("n", "<leader>ql", function()
        vim.cmd("Trouble qflist toggle")
      end, { desc = "Quickfix list (trouble)" })
    end,
  },
  {
    "typst-preview",
    filetypes = { "*.typ" },
    after = function()
      require("typst-preview").setup({
        dependencies_bin = {
          ["typst-preview"] = nixCats("bin.tinymist"),
          ["websocat"] = nixCats("bin.websocat"),
        },
      })
    end,
  },
  {
    "toggleterm.nvim",
    after = function()
      require("toggleterm").setup({
        shade_terminals = false,
      })

      vim.keymap.set({ "n", "t", "v" }, "<C-l>", function()
        vim.cmd("ToggleTerm direction=float")
      end)
      vim.keymap.set("n", "<leader>tv", function()
        vim.cmd("ToggleTerm direction=vertical")
      end)
      vim.keymap.set("n", "<leader>tt", function()
        vim.cmd("ToggleTerm direction=horizontal")
      end)
      vim.keymap.set("n", "<leader>ts", function()
        vim.cmd("TermSelect")
      end)
    end,
  },
  {
    "mini.ai",
    event = "BufEnter",
    after = function()
      require("mini.ai").setup()
    end,
  },
  {
    "mini.surround",
    event = "BufEnter",
    after = function()
      require("mini.surround").setup()
    end,
  },
  {
    "mini.starter",
    after = function()
      require("mini.starter").setup()
    end,
  },
  {
    "mini.notify",
    event = "BufEnter",
    after = function()
      require("mini.notify").setup({
        lsp_progress = { enable = false },
      })
    end,
  },
  {
    "mini.trailspace",
    event = "BufEnter",
    after = function()
      require("mini.trailspace").setup()
    end,
  },
  {
    "cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
  {
    "indent-blankline.nvim",
    after = function()
      require("ibl").setup({
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = { show_start = false, show_end = false },
        exclude = {
          filetypes = {
            "help",
            "ministarter",
            "Trouble",
            "trouble",
            "toggleterm",
          },
        },
      })
    end,
  },
  {
    "mini.bufremove",
    event = "BufEnter",
    after = function()
      require("mini.bufremove").setup()

      vim.keymap.set({ "n", "v" }, "<leader>bd", function()
        MiniBufremove.delete()
      end)
    end,
  },
  {
    "mini.hipatterns",
    event = "BufEnter",
    after = function()
      require("mini.hipatterns").setup()
    end,
  },
  {
    "neogit",
    cmd = "Neogit",
    after = function()
      require("neogit").setup({
        graph_style = "unicode",
        integrations = {
          telescope = true,
          diffview = true,
        },
      })
    end,
  },
  {
    "diffiew.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
  },
  {
    "barbecue.nvim",
    event = "BufEnter",
    after = function()
      require("barbecue").setup()
      -- triggers CursorHold event faster
      vim.opt.updatetime = 200

      require("barbecue").setup({
        create_autocmd = false, -- prevent barbecue from updating itself automatically
      })

      vim.api.nvim_create_autocmd({
        "WinResized",
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },
  {
    "undotree",
    cmd = "UndotreeToggle",
  },
}
