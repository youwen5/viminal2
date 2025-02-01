{:setup (fn []
          (local symbols {:Error "󰅙" :Info "󰋼" :Hint "󰌵" :Warn ""})
          (each [name icon (pairs symbols)]
            (let [hl (.. :DiagnosticSign name)]
              (vim.fn.sign_define hl {:text icon :numhl hl :texthl hl})))
          (let [lspconfig (require :lspconfig)]
            (lspconfig.lua_ls.setup {:settings {:Lua {:runtime {:version :LuaJIT}
                                                      :diagnostics {:globals [:nixCats]}
                                                      :telemetry {:enable false}}}})
            (lspconfig.nixd.setup {})
            (lspconfig.marksman.setup {})
            (lspconfig.tinymist.setup {:offset_encoding :utf-8})
            (lspconfig.svelte.setup {})
            (lspconfig.texlab.setup {})
            (lspconfig.clangd.setup {})
            (lspconfig.mesonlsp.setup {})
            (lspconfig.nushell.setup {})
            (lspconfig.vale_ls.setup {:filetypes [:markdown
                                                  :text
                                                  :tex
                                                  :rst
                                                  :typst]})
            (lspconfig.fennel_ls.setup {}))
          {})}
