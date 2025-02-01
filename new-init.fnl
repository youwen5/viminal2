(if (os.getenv :TERM)
    ((. (require :scripts.chameleon) :setup) (. (require :scripts.kitty-padding)
                                                :setup))
    {})
