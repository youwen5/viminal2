{1 :toggleterm.nvim
 :after (fn []
          ((. (require :toggleterm) :setup) {:shade_terminals false}))
 :keys [{1 :<C-l>
         2 (fn [] (vim.cmd "ToggleTerm direction=float"))
         :desc "Toggle terminal"
         :mode [:n :t :v]}
        {1 :<leader>tv
         2 (fn [] (vim.cmd "ToggleTerm direction=vertical"))
         :desc "Vertical terminal"
         :mode :n}
        {1 :<leader>tt
         2 (fn [] (vim.cmd "ToggleTerm direction=horizontal"))
         :desc "Horizontal terminal"
         :mode :n}
        {1 :<leader>ts
         2 (fn [] (vim.cmd :TermSelect))
         :desc "Terminal select"
         :mode :n}]}
