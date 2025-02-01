(fn get-workspaces []
  (let [all-workspaces [{:name :vault
                         :path (vim.fs.normalize "~/Documents/vaults/vault")}
                        {:name :alexandria
                         :path (vim.fs.normalize "~/Documents/alexandria/content")}]
        existing-workspaces {}]
    (each [i x (ipairs all-workspaces)]
      (when (= (vim.fn.isdirectory x.path) 1)
        (table.insert existing-workspaces (. all-workspaces i))
        (vim.notify (.. "Detected Obsidian workspace " x.path ", adding "
                        (vim.inspect (. all-workspaces i))
                        " to obsidian workspaces")
                    vim.log.levels.DEBUG)))
    existing-workspaces))

{1 :obsidian.nvim
 :after (fn []
          (local workspaces (get-workspaces))
          (when (> (length workspaces) 0)
            (local opts {:completion {:nvim_cmp false}
                         :ui {:enable false}
                         : workspaces})
            ((. (require :obsidian) :setup) opts)))
 :ft [:markdown]}
