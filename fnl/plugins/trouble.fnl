{1 :trouble.nvim
 :after (fn []
          ((. (require :trouble) :setup)))
 :cmd :Trouble
 :keys [{1 :<leader>xx
         2 (fn [] (vim.cmd "Trouble diagnostics toggle"))
         :desc :Diagnostics
         :mode :n}
        {1 :<leader>xX
         2 (fn [] (vim.cmd "Trouble diagnostics toggle filter.buf=0"))
         :desc "Buffer diagnostics"
         :mode :n}
        {1 :<leader>cs
         2 (fn [] (vim.cmd "Trouble symbols toggle"))
         :desc :Symbols
         :mode :n}
        {1 :<leader>cl
         2 (fn [] (vim.cmd "Trouble lsp toggle win.position=right"))
         :desc "LSP definitions / references /..."
         :mode :n}
        {1 :<leader>ql
         2 (fn [] (vim.cmd "Trouble qflist toggle"))
         :desc "Quickfix list (trouble)"
         :mode :n}]}
