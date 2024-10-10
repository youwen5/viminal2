return {
  "blink-cmp",
  event = "BufEnter",
  after = function()
    require("blink-cmp").setup({
      -- for keymap, all values may be string | string[]
      -- use an empty table to disable a keymap
      keymap = {
        show = "<C-space>",
        hide = "<C-e>",
        accept = "<Tab>",
        select_prev = { "<Up>", "<C-p>" },
        select_next = { "<Down>", "<C-n>" },

        show_documentation = {},
        hide_documentation = {},
        scroll_documentation_up = "<C-b>",
        scroll_documentation_down = "<C-f>",

        snippet_forward = "<Tab>",
        snippet_backward = "<S-Tab>",
      },
      highlight = {
        ns = vim.api.nvim_create_namespace("blink_cmp"),
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = false,
      },

      kind_icons = {
        Text = "󰉿",
        Method = "󰊕",
        Function = "󰊕",
        Constructor = "󰒓",

        Field = "󰜢",
        Variable = "󰆦",
        Property = "󰖷",

        Class = "󱡠",
        Interface = "󱡠",
        Struct = "󱡠",
        Module = "󰅩",

        Unit = "󰪚",
        Value = "󰦨",
        Enum = "󰦨",
        EnumMember = "󰦨",

        Keyword = "󰻾",
        Constant = "󰏿",

        Snippet = "󱄽",
        Color = "󰏘",
        File = "󰈔",
        Reference = "󰬲",
        Folder = "󰉋",
        Event = "󱐋",
        Operator = "󰪚",
        TypeParameter = "󰬛",
      },
    })
  end,
}
