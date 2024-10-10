return {
  {
    "render-markdown.nvim",
    after = function()
      require("render-markdown").setup({
        file_types = { "markdown" },
        overrides = {
          buftype = {
            nofile = {
              render_modes = { "n", "c", "i" },
              debounce = 5,
              code = {
                left_pad = 0,
                right_pad = 0,
                language_pad = 0,
              },
            },
          },
          filetype = {},
        },
      })
    end,
  },
}
