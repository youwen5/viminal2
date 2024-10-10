return {
  "conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  after = function()
    require("conform").setup({
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return { timeout_ms = 500, lsp_fallback = true }
      end,
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        rust = { "rustfmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        nix = { "nixfmt" },
        haskell = { "fourmolu", "ormolu", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        toml = { "taplo", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        typst = { "typstyle" },
      },
    })

    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
