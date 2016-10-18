(use-package lispy

  :commands
  (lispy-mode)

  :init
  (progn
    (dolist (hook '(emacs-lisp-mode-hook clojure-mode-hook))
      (add-hook hook (lambda () (lispy-mode 1)))))

  :config
  (progn
    (dolist (hook '(emacs-lisp-mode-hook clojure-mode-hook))
      (add-hook hook (lambda () (lispy-mode 1))))
    (message "Loading LISPY WOOOH")))
