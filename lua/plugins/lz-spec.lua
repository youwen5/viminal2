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
  require("plugins.trouble"),
  require("plugins.render-markdown"),
  require("plugins.toggleterm"),
  require("plugins.by-lang.latex"),
  require("plugins.neogit"),
  require("plugins.obsidian"),
  require("plugins.starter"),
  { "vim-wakatime" },
  { "clangd_extensions.nvim" },
  { "vim-sleuth" },
  {
    "nvim-lspconfig",
    event = "BufEnter",
    after = require("lsp").setup,
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
  {
    "markdown-preview.nvim",
    filetypes = { "markdown" },
  },
  {
    "typst-preview.nvim",
    filetypes = { "*.typ" },
    after = function()
      require("typst-preview").setup({
        dependencies_bin = {
          ["tinymist"] = nixCats("bin.tinymist"),
          ["websocat"] = nixCats("bin.websocat"),
        },
      })
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
    "fidget.nvim",
    after = function()
      require("fidget").setup({
        notification = {
          override_vim_notify = true,
          window = {
            border = "rounded",
            x_padding = 1,
            y_padding = 2,
          },
        },
      })
    end,
  },
  {
    "cellular-automaton.nvim",
    cmd = "CellularAutomaton",
    keys = {
      {
        "<leader>mr",
        function()
          vim.cmd.CellularAutomaton("make_it_rain")
        end,
        desc = "A surprise!",
        mode = "n",
      },
      {
        "<leader>bruh",
        function()
          vim.cmd.CellularAutomaton("game_of_life")
        end,
        desc = "A surprise!",
        mode = "n",
      },
    },
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
    keys = {
      {
        "<leader>bd",
        function()
          MiniBufremove.delete()
        end,
        mode = { "n", "v" },
        desc = "Close buffer",
      },
    },
    after = function()
      require("mini.bufremove").setup()
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
    "undotree",
    cmd = "UndotreeToggle",
    keys = {
      {
        "<leader>u",
        function()
          vim.cmd.UndotreeToggle()
        end,
        desc = "Toggle undotree",
        mode = "n",
      },
    },
  },
  {
    "neocord",
    event = "BufEnter",
    after = function()
      require("neocord").setup({
        editing_text = "Hacking %s",
        logo_tooltip = "The One True Text Editor",
        terminal_text = "Bypassing the mainframe",
        workspace_text = "The One True Text Editor",
      })
    end,
  },
  {
    "crates.nvim",
    event = "BufRead Cargo.toml",
    after = function()
      require("crates").setup({})
    end,
  },
  { "rustaceanvim" },
  { "haskell-tools.nvim" },
  {
    "typescript-tools.nvim",
    filetypes = { "typescriptreact", "typescript", "javascript", "svelte", "javascriptreact" },
    after = function()
      require("lz.n").trigger_load("nvim-lspconfig")
      require("typescript-tools").setup({})
    end,
  },
  {
    "lsp_lines.nvim",
    event = "LspAttach",
    after = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { only_current_line = true },
      })
    end,
  },
  {
    "tailwind-tools.nvim",
    after = function()
      local lz = require("lz.n")

      lz.trigger_load("telescope.nvim")
      lz.trigger_load("nvim-lspconfig")

      ---@diagnostic disable-next-line: missing-fields
      require("tailwind-tools").setup({
        conceal = { enabled = true },
        document_color = { enabled = true },
      })

      vim.keymap.set("n", "<leader>ft", function()
        vim.cmd("Telescope tailwind utilities")
      end, { desc = "Search through TailwindCSS utility classes available in the project." })
    end,
  },
  { "blink-ripgrep", lazy = true },
  { "blink.compat", lazy = true },
  {
    "lazydev.nvim",
    filetypes = { "lua" },
    after = function()
      require("lazydev").setup()
    end,
  },
  {
    "rose-pine",
    colorscheme = { "rose-pine", "rose-pine-dawn", "rose-pine-moon", "rose-pine-main" },
  },
  {
    "oxocarbon.nvim",
    colorscheme = { "oxocarbon" },
  },
  {
    "pomo-nvim",
    cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
    after = function()
      ---@diagnostic disable-next-line: missing-fields
      require("pomo").setup({
        notifiers = {
          {
            name = "Default",
            opts = {
              sticky = false,
            },
          },
          { name = "System" },
        },
        sessions = {
          pomodoro = {
            { name = "Work", duration = "25m" },
            { name = "Short Break", duration = "5m" },
            { name = "Work", duration = "25m" },
            { name = "Short Break", duration = "5m" },
            { name = "Work", duration = "25m" },
            { name = "Long Break", duration = "15m" },
          },
          grind = {
            { name = "Work", duration = "45m" },
            { name = "Short Break", duration = "5m" },
            { name = "Work", duration = "45m" },
          },
        },
      })
    end,
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope").load_extension("pomodori")
          require("telescope").extensions.pomodori.timers()
        end,
        desc = "Manage Pomodori Timers",
      },
    },
  },
  {
    "dropbar.nvim",
    after = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
  {
    "mini.files",
    after = function()
      require("mini.files").setup({
        windows = { preview = true, width_preview = 40 },
      })

      vim.keymap.set("n", "<leader>e", function()
        if vim.bo.filetype == "ministarter" then
          MiniFiles.open(nil, false)
        else
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
        end
      end)
      vim.keymap.set("n", "<leader>fe", function()
        MiniFiles.open(nil, false)
      end)
    end,
  },
  { "nfnl", ft = { "fennel" } },
}
