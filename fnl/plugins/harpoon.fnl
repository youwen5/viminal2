{1 :harpoon2
 :after (fn [] (: (require :harpoon) :setup))
 :keys [{1 :<leader>a
         2 (fn []
             (: (: (require :harpoon) :list) :add))
         :desc "Add to harpoon"
         :mode :n}
        {1 :<C-h><C-a>
         2 (fn []
             (: (: (require :harpoon) :list) :select 1))
         :desc "Select harpoon 1"
         :mode :n}
        {1 :<C-h><C-s>
         2 (fn []
             (: (: (require :harpoon) :list) :select 2))
         :desc "Select harpoon 2"
         :mode :n}
        {1 :<C-h><C-d>
         2 (fn []
             (: (: (require :harpoon) :list) :select 3))
         :desc "Select harpoon 3"
         :mode :n}
        {1 :<C-h><C-f>
         2 (fn []
             (: (: (require :harpoon) :list) :select 4))
         :desc "Select harpoon 4"
         :mode :n}
        {1 :<C-h><C-h>
         2 (fn []
             ((. (require :lz.n) :trigger_load) :telescope.nvim)
             (local conf (. (require :telescope.config) :values))

             (fn toggle-telescope [harpoon-files]
               (local file-paths {})
               (each [_ item (ipairs harpoon-files.items)]
                 (table.insert file-paths item.value))
               (: ((. (require :telescope.pickers) :new) {}
                                                         {:finder ((. (require :telescope.finders)
                                                                      :new_table) {:results file-paths})
                                                          :previewer (conf.file_previewer {})
                                                          :prompt_title :Harpoon
                                                          :sorter (conf.generic_sorter {})})
                  :find))

             (toggle-telescope (: (require :harpoon) :list)))
         :desc "toggle harpoon menu"
         :mode :n}]}
