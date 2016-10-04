(use-package evil-matchit

  :defer 4

  :config
  (global-evil-matchit-mode 1))

;; TODO don't eager-load it...
;; https://github.com/redguardtoo/evil-matchit
;; but I guess the only way is to do mode-hooks
