(vim.api.nvim_create_user_command :VaultSync
                                  (fn []
                                    (let [date (os.date "%Y-%m-%d %H:%M:%S")
                                          commit-commands ["git add -A"
                                                           (string.format "git commit -m \"auto-update(nvim): %s\""
                                                                          date)]]
                                      (each [_ cmd (ipairs commit-commands)]
                                        (vim.fn.system cmd))
                                      (vim.notify "Committed all local changes."
                                                  vim.log.levels.INFO)
                                      (vim.cmd "Neogit push")))
                                  {})

(vim.keymap.set :n :<leader>os vim.cmd.VaultSync)
