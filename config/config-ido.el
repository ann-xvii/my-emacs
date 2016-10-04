(use-package ido-vertical-mode

  :defer t ;; necessary? supposedly implied by :bind

  :bind (:map evil-normal-state-map
              (",,." . ido-dired)
              (",,/" . ido-find-file))

  :config
  (progn
    (message "loading ido");;testing lazy load
    (ido-mode 1)
    (ido-vertical-mode 1)))
