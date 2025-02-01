{1 :texpresso.vim
 :after (fn []
          (tset (require :texpresso) :texpresso_path (nixCats :bin.texpresso)))
 :cmd [:TeXpresso]
 :filetypes [:*.tex]}
