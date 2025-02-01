(import-macros {: tx} :config.macros)

(tx :render-markdown.nvim
    {:after (fn []
              ((. (require :render-markdown) :setup) {:file_types [:markdown]}))})
