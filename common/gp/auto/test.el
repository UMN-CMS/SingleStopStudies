(TeX-add-style-hook
 "test"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape")
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("standalone" "tikz")))
   (TeX-run-style-hooks
    "latex2e"
    "standalone"
    "standalone10")
   (LaTeX-add-environments
    '("twocol" LaTeX-env-args ["argument"] 0)))
 :latex)

