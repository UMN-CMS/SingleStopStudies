(TeX-add-style-hook
 "filemode-expin"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape")
   (TeX-run-style-hooks
    "pdftexcmds")
   (TeX-add-symbols
    '("filemodCmp" 2)
    "filemodNumdate"
    "filemodNumtime")
   (LaTeX-add-environments
    '("standaloneframe" LaTeX-env-args ["argument"] 0)
    '("standalone" LaTeX-env-args ["argument"] 0)))
 :latex)

