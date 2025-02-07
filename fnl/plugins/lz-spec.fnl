[(require :plugins.blink-cmp)
 (require :plugins.telescope)
 (require :plugins.oil)
 (require :plugins.harpoon)
 (require :plugins.lualine)
 (require :plugins.conform)
 (require :plugins.lsp-progress)
 (require :plugins.gitsigns)
 (require :plugins.autopairs)
 (require :plugins.trouble)
 (require :plugins.render-markdown)
 (require :plugins.toggleterm)
 (require :plugins.by-lang.latex)
 (require :plugins.neogit)
 (require :plugins.obsidian)
 (require :plugins.starter)
 [:vim-wakatime]
 [:clangd_extensions.nvim]
 [:vim-sleuth]
 {1 :nvim-lspconfig :after (. (require :lsp) :setup) :event :BufEnter}
 {1 :which-key.nvim
  :after (fn []
           ((. (require :which-key) :setup) {:delay 1000}))}
 [:nvim-web-devicons]
 {1 :markdown-preview.nvim :filetypes [:markdown]}
 {1 :typst-preview.nvim
  :after (fn []
           ((. (require :typst-preview) :setup) {:dependencies_bin {:tinymist (nixCats :bin.tinymist)
                                                                    :websocat (nixCats :bin.websocat)}}))
  :filetypes [:*.typ]}
 {1 :mini.ai
  :after (fn []
           ((. (require :mini.ai) :setup)))
  :event :BufEnter}
 {1 :mini.surround
  :after (fn []
           ((. (require :mini.surround) :setup)))
  :event :BufEnter}
 {1 :fidget.nvim
  :after (fn []
           ((. (require :fidget) :setup) {:notification {:override_vim_notify true
                                                         :window {:border :rounded
                                                                  :x_padding 1
                                                                  :y_padding 2}}}))}
 {1 :cellular-automaton.nvim
  :cmd :CellularAutomaton
  :keys [{1 :<leader>mr
          2 (fn [] (vim.cmd.CellularAutomaton :make_it_rain))
          :desc "A surprise!"
          :mode :n}
         {1 :<leader>bruh
          2 (fn [] (vim.cmd.CellularAutomaton :game_of_life))
          :desc "A surprise!"
          :mode :n}]}
 {1 :indent-blankline.nvim
  :after (fn []
           ((. (require :ibl) :setup) {:exclude {:filetypes [:help
                                                             :ministarter
                                                             :Trouble
                                                             :trouble
                                                             :toggleterm]}
                                       :indent {:char "│" :tab_char "│"}
                                       :scope {:show_end false
                                               :show_start false}}))}
 {1 :mini.bufremove
  :after (fn []
           ((. (require :mini.bufremove) :setup)))
  :keys [{1 :<leader>bd
          2 (fn [] (MiniBufremove.delete))
          :desc "Close buffer"
          :mode [:n :v]}]}
 {1 :mini.hipatterns
  :after (fn []
           ((. (require :mini.hipatterns) :setup)))
  :event :BufEnter}
 {1 :undotree
  :cmd :UndotreeToggle
  :keys [{1 :<leader>u
          2 (fn [] (vim.cmd.UndotreeToggle))
          :desc "Toggle undotree"
          :mode :n}]}
 {1 :neocord
  :after (fn []
           ((. (require :neocord) :setup) {:editing_text "Hacking %s"
                                           :logo_tooltip "The One True Text Editor"
                                           :terminal_text "Bypassing the mainframe"
                                           :workspace_text "The One True Text Editor"}))
  :event :BufEnter}
 {1 :crates.nvim
  :after (fn []
           ((. (require :crates) :setup) {}))
  :event "BufRead Cargo.toml"}
 [:rustaceanvim]
 {1 :haskell-tools.nvim
  :after (fn []
           (local ht (require :haskell-tools))
           (local bufnr (vim.api.nvim_get_current_buf))
           (local opts {:noremap true :silent true :buffer bufnr})
           (let [s vim.keymap.set]
             (s :n :<leader>hs ht.hoogle.hoogle_signature opts)
             (s :n :<leader>hrr ht.repl.toggle opts)
             (s :n :<leader>hrf
                (fn []
                  (ht.repl.toggle (vim.api.nvim_buf_get_name 0)))
                opts)
             (s :n :<leader>hrq ht.repl.quit opts)))}
 {1 :typescript-tools.nvim
  :after (fn []
           ((. (require :lz.n) :trigger_load) :nvim-lspconfig)
           ((. (require :typescript-tools) :setup) {}))
  :filetypes [:typescriptreact
              :typescript
              :javascript
              :svelte
              :javascriptreact]}
 {1 :lsp_lines.nvim
  :after (fn []
           ((. (require :lsp_lines) :setup))
           (vim.diagnostic.config {:virtual_lines {:only_current_line true}
                                   :virtual_text false}))
  :event :LspAttach}
 {1 :tailwind-tools.nvim
  :after (fn []
           (local lz (require :lz.n))
           (lz.trigger_load :telescope.nvim)
           (lz.trigger_load :nvim-lspconfig)
           ((. (require :tailwind-tools) :setup) {:conceal {:enabled true}
                                                  :document_color {:enabled true}})
           (vim.keymap.set :n :<leader>ft
                           (fn [] (vim.cmd "Telescope tailwind utilities"))
                           {:desc "Search through TailwindCSS utility classes available in the project."}))}
 {1 :blink-ripgrep :lazy true}
 {1 :blink.compat :lazy true}
 {1 :lazydev.nvim
  :after (fn []
           ((. (require :lazydev) :setup)))
  :filetypes [:lua]}
 {1 :rose-pine
  :colorscheme [:rose-pine :rose-pine-dawn :rose-pine-moon :rose-pine-main]}
 {1 :oxocarbon.nvim :colorscheme [:oxocarbon]}
 {1 :pomo-nvim
  :after (fn []
           ((. (require :pomo) :setup) {:notifiers [{:name :Default
                                                     :opts {:sticky false}}
                                                    {:name :System}]
                                        :sessions {:grind [{:duration :45m
                                                            :name :Work}
                                                           {:duration :5m
                                                            :name "Short Break"}
                                                           {:duration :45m
                                                            :name :Work}]
                                                   :pomodoro [{:duration :25m
                                                               :name :Work}
                                                              {:duration :5m
                                                               :name "Short Break"}
                                                              {:duration :25m
                                                               :name :Work}
                                                              {:duration :5m
                                                               :name "Short Break"}
                                                              {:duration :25m
                                                               :name :Work}
                                                              {:duration :15m
                                                               :name "Long Break"}]}}))
  :cmd [:TimerStart :TimerRepeat :TimerSession]
  :keys [{1 :<leader>fp
          2 (fn []
              ((. (require :telescope) :load_extension) :pomodori)
              ((. (require :telescope) :extensions :pomodori :timers)))
          :desc "Manage Pomodori Timers"}]}
 {1 :dropbar.nvim
  :after (fn [] (local dropbar-api (require :dropbar.api))
           (vim.keymap.set :n "<Leader>;" dropbar-api.pick
                           {:desc "Pick symbols in winbar"})
           (vim.keymap.set :n "[;" dropbar-api.goto_context_start
                           {:desc "Go to start of current context"})
           (vim.keymap.set :n "];" dropbar-api.select_next_context
                           {:desc "Select next context"}))}
 {1 :mini.files
  :after (fn []
           ((. (require :mini.files) :setup) {:windows {:preview true
                                                        :width_preview 40}})
           (vim.keymap.set :n :<leader>e
                           (fn []
                             (if (= vim.bo.filetype :ministarter)
                                 (MiniFiles.open nil false)
                                 (MiniFiles.open (vim.api.nvim_buf_get_name 0)))))
           (vim.keymap.set :n :<leader>fe (fn [] (MiniFiles.open nil false))))}
 {1 :nfnl :ft [:fennel]}]
