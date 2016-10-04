(use-package projectile

  :bind (:map evil-normal-state-map
 ;projectile-find-file
 ;projectile-kill-buffers
              (",pa" . projectile-ag))

  :init
  (progn
    ;;(setq projectile-use-native-indexing t)
    (setq projectile-completion-system 'grizzl)
    (setq projectile-use-git-grep t))

  :config (projectile-global-mode))
