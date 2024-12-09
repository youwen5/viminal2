return {
  "blink-cmp",
  event = "BufEnter",
  after = function()
    require("blink-cmp").setup({
      -- for keymap, all values may be string | string[]
      -- use an empty table to disable a keymap
      keymap = {
        preset = "default",
      },
    })
  end,
}
