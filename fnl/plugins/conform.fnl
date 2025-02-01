{1 :conform.nvim
 :after (fn []
          ((. (require :conform) :setup) {:default_format_opts {:lsp_format :fallback}
                                          :format_on_save (fn [bufnr]
                                                            (when (or vim.g.disable_autoformat
                                                                      (. vim.b
                                                                         bufnr
                                                                         :disable_autoformat))
                                                              (lua "return "))
                                                            {:lsp_fallback true
                                                             :timeout_ms 500})
                                          :formatters_by_ft {:c {1 :clang-format
                                                                 :lsp_format :fallback}
                                                             :cpp {1 :clang-format
                                                                   :lsp_format :fallback}
                                                             :fennel {1 :fnlfmt
                                                                      :lsp_format :fallback}
                                                             :haskell {1 :fourmolu
                                                                       2 :ormolu
                                                                       :stop_after_first true}
                                                             :javascript {1 :prettierd
                                                                          2 :prettier
                                                                          :stop_after_first true}
                                                             :json {1 :prettierd
                                                                    2 :prettier
                                                                    :stop_after_first true}
                                                             :jsonc {1 :prettierd
                                                                     2 :prettier
                                                                     :stop_after_first true}
                                                             :jypescriptreact {1 :prettierd
                                                                               2 :prettier
                                                                               :stop_after_first true}
                                                             :lua [:stylua]
                                                             :nix [:nixfmt]
                                                             :python [:black]
                                                             :rust {1 :rustfmt
                                                                    :lsp_format :fallback}
                                                             :svelte {1 :prettier
                                                                      :lsp_format :fallback}
                                                             :tex [:latexindent]
                                                             :toml {1 :taplo
                                                                    :stop_after_first true}
                                                             :typescript {1 :prettierd
                                                                          2 :prettier
                                                                          :stop_after_first true}
                                                             :typescriptreact {1 :prettierd
                                                                               2 :prettier
                                                                               :stop_after_first true}
                                                             :typst [:typstyle]
                                                             :yaml {1 :prettierd
                                                                    2 :prettier
                                                                    :stop_after_first true}}})
          (set vim.o.formatexpr "v:lua.require'conform'.formatexpr()"))
 :cmd :ConformInfo
 :event :BufWritePre
 :keys [{1 :<leader>cf
         2 (fn []
             ((. (require :conform) :format) {:async true}))
         :desc "Format code"
         :mode [:n :v]}
        {1 :<leader>ctf
         2 (fn []
             (if vim.g.disable_autoformat (set vim.g.disable_autoformat false)
                 (set vim.g.disable_autoformat true)))
         :desc "Disable autoformat on save globally"
         :mode [:n :v]}
        {1 :<leader>cbf
         2 (fn []
             (if (. vim.b 0 :disable_autoformat)
                 (tset (. vim.b 0) :disable_autoformat false)
                 (tset (. vim.b 0) :disable_autoformat true)))
         :desc "Disable autoformat on save buffer"
         :mode [:n :v]}]}
