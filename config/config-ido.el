(use-package ido-vertical-mode

  :bind (:map evil-normal-state-map
              (",,." . ido-dired)
              (",,/" . ido-find-file))

  :config
  (progn
    (ido-mode 1)
    (ido-vertical-mode 1)))
