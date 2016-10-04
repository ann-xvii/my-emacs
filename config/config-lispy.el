(use-package lispy

  :bind (:map clojure-mode-map
              ("s-/" . lispy-describe-inline)
              ("s-." . lispy-arglist-inline)
              ("s-j" . lispy-eval-and-comment)
              ("s-k" . lispy-eval-and-replace)
              ("s-m" . lispy-alt-multiline))

  :defer 4

  :config
  (progn
    (message "Loading LISPY WOOOH")
    (dolist (hook '(emacs-lisp-mode-hook clojure-mode-hook))
      (add-hook hook (lambda () (lispy-mode 1))))
    ))
