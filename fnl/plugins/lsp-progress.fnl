;; Adds LSP information to Lualine

{1 :lsp-progress.nvim
 :after (fn []
          ((. (require :lsp-progress) :setup) {:client_format (fn [client-name
                                                                   spinner
                                                                   series-messages]
                                                                (when (= (length series-messages)
                                                                         0)
                                                                  (lua "return nil"))
                                                                {:body (.. spinner
                                                                           " "
                                                                           (table.concat series-messages
                                                                                         ", "))
                                                                 :name client-name})
                                               :format (fn [client-messages]
                                                         (fn stringify [name
                                                                        msg]
                                                           (or (and msg
                                                                    (string.format "%s %s"
                                                                                   name
                                                                                   msg))
                                                               name))

                                                         (local sign "󰆧")
                                                         (local lsp-clients
                                                                (vim.lsp.get_clients))
                                                         (local messages-map {})
                                                         (each [_ climsg (ipairs client-messages)]
                                                           (tset messages-map
                                                                 climsg.name
                                                                 climsg.body))
                                                         (when (> (length lsp-clients)
                                                                  0)
                                                           (table.sort lsp-clients
                                                                       (fn [a
                                                                            b]
                                                                         (< a.name
                                                                            b.name)))
                                                           (local builder {})
                                                           (each [_ cli (ipairs lsp-clients)]
                                                             (when (and (and (= (type cli)
                                                                                :table)
                                                                             (= (type cli.name)
                                                                                :string))
                                                                        (> (string.len cli.name)
                                                                           0))
                                                               (if (. messages-map
                                                                      cli.name)
                                                                   (table.insert builder
                                                                                 (stringify cli.name
                                                                                            (. messages-map
                                                                                               cli.name)))
                                                                   (table.insert builder
                                                                                 (stringify cli.name)))))
                                                           (when (> (length builder)
                                                                    0)
                                                             (let [___antifnl_rtn_1___ (.. sign
                                                                                           " "
                                                                                           (table.concat builder
                                                                                                         ", "))]
                                                               (lua "return ___antifnl_rtn_1___"))))
                                                         "")}))
 :event :LspAttach}
