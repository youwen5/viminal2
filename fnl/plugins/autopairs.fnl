(import-macros {: tx} :config.macros)
(tx :nvim-autopairs
    {:event :BufEnter :after (. (require :nvim-autopairs) :setup)})
