{1 :oil.nvim
 :after (fn []
          ((. (require :oil) :setup) {:columns [:size :icon]
                                      :default_file_explorer false
                                      :keymaps {:<C-h> :actions.select_split
                                                :<C-l> :actions.refresh
                                                :<C-p> :actions.preview
                                                :<C-s> :actions.select_vsplit
                                                :<C-t> :actions.select_tab
                                                :<CR> :actions.select
                                                :J :actions.parent
                                                :K :actions.select
                                                :Q :actions.close
                                                :_ :actions.open_cwd
                                                "`" :actions.cd
                                                :g. :actions.toggle_hidden
                                                :g? :actions.show_help
                                                "g\\" :actions.toggle_trash
                                                :gs :actions.change_sort
                                                :gx :actions.open_external
                                                "~" :actions.tcd}
                                      :use_default_keymaps false}))
 :cmd :Oil
 :keys [{1 :<leader>bf
         2 (fn []
             (vim.cmd (.. "Oil " (vim.fn.getcwd))))
         :desc "Open oil in current working directory"
         :mode :n}
        {1 :<leader>be
         2 vim.cmd.Oil
         :desc "Open oil in current file directory"
         :mode :n}]}
