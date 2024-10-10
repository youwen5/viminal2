return {
  require("plugins.blink-cmp"),
  require("plugins.telescope"),
  require("plugins.oil"),
  require("plugins.harpoon"),
  require("plugins.lualine"),
  require("plugins.conform"),
  {
    "lsp-progress",
    after = function()
      require("lsp-progress").setup({
        client_format = function(client_name, spinner, series_messages)
          if #series_messages == 0 then
            return nil
          end
          return {
            name = client_name,
            body = spinner .. " " .. table.concat(series_messages, ", "),
          }
        end,
        format = function(client_messages)
          --- @param name string
          --- @param msg string?
          --- @return string
          local function stringify(name, msg)
            return msg and string.format("%s %s", name, msg) or name
          end

          local sign = "󰆧" -- nf-fa-gear \uf013
          local lsp_clients = vim.lsp.get_clients()
          local messages_map = {}
          for _, climsg in ipairs(client_messages) do
            messages_map[climsg.name] = climsg.body
          end

          if #lsp_clients > 0 then
            table.sort(lsp_clients, function(a, b)
              return a.name < b.name
            end)
            local builder = {}
            for _, cli in ipairs(lsp_clients) do
              if type(cli) == "table" and type(cli.name) == "string" and string.len(cli.name) > 0 then
                if messages_map[cli.name] then
                  table.insert(builder, stringify(cli.name, messages_map[cli.name]))
                else
                  table.insert(builder, stringify(cli.name))
                end
              end
            end
            if #builder > 0 then
              return sign .. " " .. table.concat(builder, ", ")
            end
          end
          return ""
        end,
      })
    end,
  },
  { "telescope-ui-select.nvim", priority = 70 },
  {
    "nvim-autopairs",
    event = "BufEnter",
    after = function()
      require("nvim-autopairs").setup()
    end,
  },
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
    "gitsigns.nvim",
    event = "BufEnter",
    after = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end)

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end)

          -- Actions
          map("n", "<leader>gs", gitsigns.stage_hunk)
          map("n", "<leader>gr", gitsigns.reset_hunk)
          map("v", "<leader>gs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)
          map("v", "<leader>gr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)
          map("n", "<leader>gS", gitsigns.stage_buffer)
          map("n", "<leader>gu", gitsigns.undo_stage_hunk)
          map("n", "<leader>gR", gitsigns.reset_buffer)
          map("n", "<leader>gp", gitsigns.preview_hunk)
          map("n", "<leader>gb", function()
            gitsigns.blame_line({ full = true })
          end)
          map("n", "<leader>gb", gitsigns.toggle_current_line_blame)
          map("n", "<leader>gd", gitsigns.diffthis)
          map("n", "<leader>gD", function()
            gitsigns.diffthis("~")
          end)
          map("n", "<leader>gtd", gitsigns.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
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
