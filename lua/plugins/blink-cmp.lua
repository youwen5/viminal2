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

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        menu = { border = "single" },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          update_delay_ms = 50,
          treesitter_highlighting = true,
          window = { border = "single" },
        },
      },
      signature = { window = { border = "single" } },
      fuzzy = { prebuilt_binaries = { force_version = "" } },
    })
  end,
}
