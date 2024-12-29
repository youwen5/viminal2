return {
  "blink.cmp",
  event = "BufEnter",
  after = function()
    require("blink.cmp").setup({
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
      },
      sources = {},
      completion = {
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "kind_icon", "kind" },
              { "label", "label_description", gap = 2 },
            },
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          update_delay_ms = 50,
          treesitter_highlighting = true,
          window = { border = "rounded" },
        },
      },
      signature = {
        window = { border = "rounded" },
        enabled = true,
      },
      fuzzy = { prebuilt_binaries = { download = false } },
    })
  end,
}
