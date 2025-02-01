{1 :lualine.nvim
 :after (fn []
          ((. (require :lualine) :setup) {:extensions {}
                                          :inactive_sections {:lualine_a {}
                                                              :lualine_b {}
                                                              :lualine_c [:filename]
                                                              :lualine_x [:location]
                                                              :lualine_y {}
                                                              :lualine_z {}}
                                          :inactive_winbar {}
                                          :options {:always_divide_middle true
                                                    :component_separators {:left ""
                                                                           :right ""}
                                                    :disabled_filetypes {:statusline [:ministarter]
                                                                         :winbar {}}
                                                    :globalstatus true
                                                    :icons_enabled true
                                                    :ignore_focus {}
                                                    :refresh {:statusline 1000
                                                              :tabline 1000
                                                              :winbar 1000}
                                                    :section_separators {:left ""
                                                                         :right ""}
                                                    :theme :auto}
                                          :sections {:lualine_a [:branch]
                                                     :lualine_b [:filetype]
                                                     :lualine_c [:progress
                                                                 (fn []
                                                                   ((. (require :lz.n)
                                                                       :trigger_load) :lsp-progress)
                                                                   ((. (require :lsp-progress)
                                                                       :progress)))]
                                                     :lualine_x [(fn []
                                                                   (local (ok pomo)
                                                                          (pcall require
                                                                                 :pomo))
                                                                   (when (not ok)
                                                                     (lua "return \"\""))
                                                                   (local timer
                                                                          (pomo.get_first_to_finish))
                                                                   (when (= timer
                                                                            nil)
                                                                     (lua "return \"\""))
                                                                   (.. "󰄉 "
                                                                       (tostring timer)))
                                                                 :encoding
                                                                 :fileformat]
                                                     :lualine_y [:diff
                                                                 :diagnostics]
                                                     :lualine_z [:location]}
                                          :tabline {}
                                          :winbar {}})
          (vim.api.nvim_create_augroup :lualine_augroup {:clear true})
          (vim.api.nvim_create_autocmd :User
                                       {:callback (. (require :lualine)
                                                     :refresh)
                                        :group :lualine_augroup
                                        :pattern :LspProgressStatusUpdated}))}
