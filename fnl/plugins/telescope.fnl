{1 :telescope.nvim
 :after (fn []
          ((. (require :telescope) :setup) {:extensions {:ui-select [((. (require :telescope.themes)
                                                                         :get_dropdown) {})]}})
          ((. (require :telescope) :load_extension) :fzf)
          ((. (require :telescope) :load_extension) :ui-select))
 :keys [{1 "<leader> "
         2 (fn []
             (local builtin (require :telescope.builtin))
             (local is-git (vim.fn.finddir :.git (.. (vim.fn.getcwd) ";")))
             (if is-git (builtin.git_files) (builtin.find_files)))
         :desc "Grep through all files tracked by git, or fall back to just cwd"
         :mode :n}
        {1 :<leader>ff
         2 (fn []
             ((. (require :telescope.builtin) :find_files)))
         :desc "Grep through all files in cwd"
         :mode :n}
        {1 :<leader>ca
         2 vim.lsp.buf.code_action
         :desc "LSP Code Action"
         :mode :n}
        {1 :<leader>/
         2 (fn []
             ((. (require :telescope.builtin) :live_grep)))
         :desc "Live grep"
         :mode :n}
        {1 :<leader>k
         2 (fn []
             ((. (require :telescope.builtin) :buffers)))
         :desc "List buffers"
         :mode :n}
        {1 :gd
         2 (fn []
             ((. (require :telescope.builtin) :lsp_definitions)))
         :desc "Go to LSP definition"
         :mode :n}
        {1 :gi
         2 (fn []
             ((. (require :telescope.builtin) :lsp_implementations)))
         :desc "Go to implementations"
         :mode :n}
        {1 :<leader>j
         2 (fn []
             ((. (require :telescope.builtin) :lsp_document_symbols)))
         :desc "Search through document symbols"
         :mode :n}
        {1 :<leader>fs
         2 (fn []
             ((. (require :telescope.builtin) :lsp_workspace_symbols)))
         :desc "Search through entire workspace symbols"
         :mode :n}
        {1 :<leader>fd
         2 (fn []
             ((. (require :telescope.builtin) :diagnostics)))
         :desc "Search through LSP diagnostics"
         :mode :n}]}
