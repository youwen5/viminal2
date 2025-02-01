(import-macros {: tx} :config.macros)
(tx :nvim-autopairs
    {:event :BufEnter :after (fn [] (. (require :nvim-autopairs) :setup))})
