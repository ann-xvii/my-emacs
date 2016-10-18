(use-package scala-mode

  :mode "\\.scala\\'"


  :config (message "Loaded scala-mode"))

(use-package ensime

  :bind (("s-\\ s-]" . ensime)
         :map ensime-mode-map
         ("s-\\ s-r"   . ensime-reload)
         ("s-\\ s-SPC" . ensime-inf-switch)
         ("s-\\ s-\\"  . ensime-inf-eval-definition)
         ("s-r"        . ensime-inf-eval-region)
         ("s-h"        . ensime-inf-eval-result)
         ("s-b"        . ensime-inf-eval-buffer)
         ("s-k"        . ensime-inf-quit-interpreter)
         ("s-e"        . ensime-stacktrace-switch)
         ("s-\\ s-SPC" . ensime-stacktrace-highlight)
         ("s-\\ s-s"   . hs-show-block)
         ("s-\\ s-a"   . hs-show-all)
         ([tab] . company-complete))

  :config
  (progn
    (define-key ensime-mode-map (kbd "<tab>") 'company-complete)

    (message "Starting Scala interpreter...")
    (ensime-inf-switch)))


;; Ensime site has some interesting general Emacs info:
;; http://ensime.github.io/editors/emacs/hacks/#projects
