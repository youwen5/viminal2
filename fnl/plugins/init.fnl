(vim.loader.enable)
(let [plugins (require :plugins.lz-spec)]
  ((. (require :lz.n) :load) plugins))
