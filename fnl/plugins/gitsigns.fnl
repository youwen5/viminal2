{1 :gitsigns.nvim
 :after (fn []
          ((. (require :gitsigns) :setup) {:on_attach (fn [bufnr]
                                                        (local gitsigns
                                                               (require :gitsigns))

                                                        (fn map [mode l r opts]
                                                          (set-forcibly! opts
                                                                         (or opts
                                                                             {}))
                                                          (set opts.buffer
                                                               bufnr)
                                                          (vim.keymap.set mode
                                                                          l r
                                                                          opts))

                                                        (map :n "]c"
                                                             (fn []
                                                               (if vim.wo.diff
                                                                   (vim.cmd.normal {1 "]c"
                                                                                    :bang true})
                                                                   (gitsigns.nav_hunk :next))))
                                                        (map :n "[c"
                                                             (fn []
                                                               (if vim.wo.diff
                                                                   (vim.cmd.normal {1 "[c"
                                                                                    :bang true})
                                                                   (gitsigns.nav_hunk :prev))))
                                                        (map :n :<leader>gs
                                                             gitsigns.stage_hunk)
                                                        (map :n :<leader>gr
                                                             gitsigns.reset_hunk)
                                                        (map :v :<leader>gs
                                                             (fn []
                                                               (gitsigns.stage_hunk [(vim.fn.line ".")
                                                                                     (vim.fn.line :v)])))
                                                        (map :v :<leader>gr
                                                             (fn []
                                                               (gitsigns.reset_hunk [(vim.fn.line ".")
                                                                                     (vim.fn.line :v)])))
                                                        (map :n :<leader>gS
                                                             gitsigns.stage_buffer)
                                                        (map :n :<leader>gu
                                                             gitsigns.undo_stage_hunk)
                                                        (map :n :<leader>gR
                                                             gitsigns.reset_buffer)
                                                        (map :n :<leader>gp
                                                             gitsigns.preview_hunk)
                                                        (map :n :<leader>gb
                                                             (fn []
                                                               (gitsigns.blame_line {:full true})))
                                                        (map :n :<leader>gb
                                                             gitsigns.toggle_current_line_blame)
                                                        (map :n :<leader>gd
                                                             gitsigns.diffthis)
                                                        (map :n :<leader>gD
                                                             (fn []
                                                               (gitsigns.diffthis "~")))
                                                        (map :n :<leader>gtd
                                                             gitsigns.toggle_deleted)
                                                        (map [:o :x] :ih
                                                             ":<C-U>Gitsigns select_hunk<CR>"))}))
 :event :BufEnter}
