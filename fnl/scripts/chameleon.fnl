;; MIT License
;; Copyright (c) 2023 Shaun Mathew
;; <https://github.com/shaun-mathew/Chameleon.nvim>
;; Transformed to Fennel by antifennel <https://fennel-lang.org/see>

(local M {})
(local ___fn___ vim.fn)
(local api vim.api)
(set M.original_color nil)
(fn get-kitty-background []
  (when (= M.original_color nil)
    (___fn___.jobstart [:kitty "@" :get-colors]
                       {:on_stderr (fn [_ d _]
                                     (when (> (length d) 1)
                                       (vim.notify "Chameleon.nvim: Error getting background. Make sure kitty remote control is turned on."
                                                   vim.log.levels.DEBUG)))
                        :on_stdout (fn [_ d _]
                                     (each [_ result (ipairs d)]
                                       (when (string.match result :^background)
                                         (local color
                                                (. (vim.split result "%s+") 2))
                                         (set M.original_color color)
                                         (lua :break))))})))

(fn change-background [color sync]
  (let [arg (.. "background=\"" color "\"")
        command (.. "kitty @ set-colors " arg)]
    (if (not sync)
        (___fn___.jobstart command
                           {:on_stderr (fn [_ d _]
                                         (when (> (length d) 1)
                                           (vim.notify "Chameleon.nvim: Error changing background. Make sure kitty remote control is turned on."
                                                       vim.log.levels.DEBUG)))})
        (___fn___.system command))))

(fn setup-autocmds []
  (let [autocmd api.nvim_create_autocmd
        autogroup api.nvim_create_augroup
        bg-change (autogroup :BackgroundChange {:clear true})]
    (autocmd [:ColorScheme :VimResume]
             {:callback (fn []
                          (local color
                                 (string.format "#%06X"
                                                (. (vim.api.nvim_get_hl 0
                                                                        {:name :Normal})
                                                   :bg)))
                          (change-background color))
              :group bg-change
              :pattern "*"})
    (autocmd :User {:callback (fn []
                                (local color
                                       (string.format "#%06X"
                                                      (. (vim.api.nvim_get_hl 0
                                                                              {:name :Normal})
                                                         :bg)))
                                (change-background color))
                    :group bg-change
                    :pattern :NvChadThemeReload})
    (autocmd [:VimLeavePre :VimSuspend]
             {:callback (fn []
                          (when (not= M.original_color nil)
                            (change-background M.original_color true)))
              :group (autogroup :BackgroundRestore {:clear true})})))

(fn M.setup [] (get-kitty-background) (setup-autocmds))
M
