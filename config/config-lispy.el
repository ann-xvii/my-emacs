(use-package lispy

  ;;:demand t  ;; is there a better way? I want it to load with clojure-mode...
  ;; https://github.com/jwiegley/use-package

  :bind (:map clojure-mode-map
              ("s-/" . lispy-describe-inline)
              ("s-." . lispy-arglist-inline)
              ("s-j" . lispy-eval-and-comment)
              ("s-k" . lispy-eval-and-replace)
              ("s-m" . lispy-alt-multiline))

  :defer 4

  :config
  (progn
    (dolist (hook '(emacs-lisp-mode-hook clojure-mode-hook))
      (add-hook hook (lambda () (lispy-mode 1))))
    (message "Loading LISPY WOOOH")))
