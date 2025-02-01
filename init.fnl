(when (= (os.getenv :TERM) :xterm-kitty)
  ((. (require :scripts.chameleon) :setup))
  ((. (require :scripts.kitty-padding) :setup)))

(require :keymaps)
(require :plugins)
(require :scripts.obsidian-sync)
((. (require :scripts.autoroot) :setup))
(set vim.opt.relativenumber true)
(set vim.opt.number true)
(set vim.opt.laststatus 3)
(set vim.opt.undofile true)
(set vim.opt.tabstop 4)
(set vim.opt.shiftwidth 2)
(set vim.treesitter.indent true)
(set vim.opt.foldexpr "nvim_treesitter#foldexpr()")
(set vim.opt.foldmethod :expr)
(set vim.opt.foldenable false)
(set vim.opt.signcolumn :yes)
(set vim.opt.updatetime 250)
(set vim.opt.list true)
(set vim.opt.listchars {:nbsp "␣" :tab "» " :trail "·"})
(set vim.opt.scrolloff 10)
(vim.cmd.colorscheme :oxocarbon)
(set vim.g.node_host_prog (nixCats :bin.neovim-node-host))
(set vim.g.loaded_node_provider nil)
((. (require :nvim-treesitter.configs) :setup) {:additional_vim_regex_highlighting false
                                                :auto_install false
                                                :disable (fn [_ buf]
                                                           (local max-filesize
                                                                  (* 100 1024))
                                                           (local (ok stats)
                                                                  (pcall vim.loop.fs_stat
                                                                         (vim.api.nvim_buf_get_name buf)))
                                                           (when (and (and ok
                                                                           stats)
                                                                      (> stats.size
                                                                         max-filesize))
                                                             true))
                                                :ensure_installed {}
                                                :highlight {:enable true}
                                                :ignore_install {}
                                                :incremental_selection {:enable true
                                                                        :keymaps {:init_selection :<CR>
                                                                                  :node_decremental :<C-j>
                                                                                  :node_incremental :<C-k>
                                                                                  :scope_incremental :<BS>}}
                                                :modules [:highlight
                                                          :incremental_selection
                                                          :indent]
                                                :sync_install false})

(vim.api.nvim_create_autocmd [:TermOpen]
                             {:callback (fn []
                                          (vim.cmd "setlocal nonumber norelativenumber"))
                              :group (vim.api.nvim_create_augroup :terminal {})})

(vim.api.nvim_create_autocmd :TextYankPost
                             {:callback (fn []
                                          (vim.highlight.on_yank {:higroup :Visual
                                                                  :timeout 300}))})

(set vim.lsp.handlers.textDocument/hover
     (vim.lsp.with vim.lsp.handlers.hover {:silent true}))

(vim.api.nvim_create_autocmd [:VimResized]
                             {:callback (fn []
                                          (local current-tab
                                                 (vim.api.nvim_get_current_tabpage))
                                          (vim.cmd "tabdo wincmd =")
                                          (vim.api.nvim_set_current_tabpage current-tab))
                              :desc "Resize splits with terminal window"
                              :group (vim.api.nvim_create_augroup :EqualizeSplits
                                                                  {})})
