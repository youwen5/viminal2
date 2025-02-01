{1 :neogit
 :after (fn []
          (fn graph-style []
            (if (= (os.getenv :TERM) :xterm-kitty) :kitty :ascii))

          ((. (require :neogit) :setup) {:graph_style (graph-style)
                                         :integrations {:telescope true}
                                         :kind :replace}))
 :before (fn [] (local lz (require :lz.n)) (lz.trigger_load :telescope.nvim))
 :cmd :Neogit
 :keys [{1 :<leader>gg 2 (fn [] (vim.cmd.Neogit)) :desc "Open neogit" :mode :n}
        {1 :<leader>gc
         2 (fn [] (vim.cmd.Neogit "kind=floating commit"))
         :desc "Open neogit commit menu"
         :mode :n}]}
