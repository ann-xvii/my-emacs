(use-package yasnippet
  
  :commands
  (yas-minor-mode)

  :init
  (progn
    (add-hook 'clojure-mode-hook #'yas-minor-mode))

  :config (yas-reload-all))
