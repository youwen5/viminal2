;; remove padding from kitty terminal when entering vim

(local M {})
(local ___fn___ vim.fn)
(local api vim.api)
(local autocmd api.nvim_create_autocmd)
(local autogroup api.nvim_create_augroup)
(fn no-padding [sync]
  (let [command "kitty @ set-spacing padding-h=0 padding-bottom=0"]
    (if (not sync)
        (___fn___.jobstart command
                           {:on_stderr (fn [_ d _]
                                         (when (> (length d) 1)
                                           (vim.notify "Error setting window padding. Make sure kitty remote control is turned on."
                                                       vim.log.levels.DEBUG)))})
        (___fn___.system command))))

(fn restore-padding [sync]
  (let [command "kitty @ set-spacing padding=default"]
    (if (not sync)
        (___fn___.jobstart command
                           {:on_stderr (fn [_ d _]
                                         (when (> (length d) 1)
                                           (vim.notify "Error setting window padding. Make sure kitty remote control is turned on."
                                                       vim.log.levels.DEBUG)))})
        (___fn___.system command))))

(fn M.setup []
  (autocmd [:VimResume :VimEnter]
           {:callback (fn [] (no-padding))
            :group (autogroup :SpacingRemove {:clear true})
            :pattern "*"})
  (autocmd [:VimLeavePre :VimSuspend]
           {:callback (fn [] (restore-padding true))
            :group (autogroup :SpacingRestore {:clear true})}))

M
