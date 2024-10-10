return {
    require("plugins.blink-cmp"),
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
        "intellitab-nvim",
        keys = "tab",
    },
    {
        "sleuth",
        event = "BufEnter",
    },
}
