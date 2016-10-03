(require 'highlight)
(require 'eval-sexp-fu)


(evil-define-key 'normal emacs-lisp-mode-map ",fi" 'indent-region)
(define-key emacs-lisp-mode-map (kbd "s-\\ s-\\") 'eval-last-sexp)
(define-key emacs-lisp-mode-map (kbd "s-r")       'eval-region   )

;; treat - as a word char in emacs lisp (same for clojure)
(add-hook 'emacs-lisp-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
(add-hook 'emacs-lisp-mode-hook #'esf-initialize)


