;; Copyright 2021 Pedro Alves

;; Makes it so hitting <Tab> at the start of a line puts you where smartindent
;; would have
;;
;; Converted by antifennel <https://fennel-lang.org/see>

(local v vim.api)
(local treesitter (require :nvim-treesitter))
(fn get-line-indent [line sw]
  (var indent 0)
  (each [c (line:gmatch "%s")]
    (if (= c "\t") (set indent (+ indent sw)) (set indent (+ indent 1))))
  indent)

(fn indent []
  (let [cursor (v.nvim_win_get_cursor 0)
        line (. (v.nvim_buf_get_lines 0 (- (. cursor 1) 1) (. cursor 1) false)
                1)
        indentexpr (v.nvim_get_option_value :indentexpr {:buf 0})
        expand (v.nvim_get_option_value :expandtab {:buf 0})
        shiftwidth (v.nvim_eval "shiftwidth()")
        tab-char (v.nvim_replace_termcodes :<Tab> true true true)]
    (var indent-goal nil)
    (when (and (not= treesitter nil) (not= treesitter.get_indent nil))
      (set indent-goal (treesitter.get_indent line)))
    (when (or (= indent-goal nil) (< indent-goal 0))
      (if (not= indentexpr "") (set indent-goal (v.nvim_eval indentexpr))
          (v.nvim_get_option_value :cindent {:buf 0})
          (set indent-goal (v.nvim_call_function :cindent [(. cursor 1)]))
          (set indent-goal (v.nvim_call_function :indent [(. cursor 1)]))))
    (when (and (= indent-goal (- 1)) (not= (. cursor 1) 1))
      (local prev-line (. (v.nvim_buf_get_lines 0 (- (. cursor 1) 2)
                                                (- (. cursor 1) 1) false)
                          1))
      (set indent-goal (get-line-indent prev-line shiftwidth)))
    (v.nvim_win_set_cursor 0 cursor)
    (if (and (and (and (= (. cursor 2) 0) (= line "")) (not= indent-goal nil))
             (> indent-goal 0))
        (do
          (var i 0)
          (while (< i indent-goal)
            (if expand (do
                         (v.nvim_feedkeys " " :n true)
                         (set i (+ i 1)))
                (do
                  (v.nvim_feedkeys tab-char :n true)
                  (set i (+ i shiftwidth)))))
          (print i indent-goal))
        (v.nvim_feedkeys tab-char :n true))))

{: indent}
