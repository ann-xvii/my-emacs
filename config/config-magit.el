(use-package magit

  :bind (:map evil-normal-state-map
         (",gs"  . magit-status)
         (",gd"  . magit-diff-unstaged)
         (",gl"  . magit-log)
         (",gb"  . magit-blame-mode)
         (",g,c" . magit-quick-commit)

         :map magit-blame-mode-map
         (",gb" . magit-blame-locate-commit))

  :init
  (progn

    (load "evil-magit.el")
    (set-evil-magit-bindings)

    (defun magit-quick-commit ()
      (interactive)
      (magit-stage-all)
      (magit-commit))

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; start commit with insert mode
    (evil-set-initial-state 'git-commit-mode 'insert)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; silence the warning that buffers out of sync with the index will be auto-reverted
    (setq magit-last-seen-setup-instructions "1.4.0")))

(use-package github-browse-file
  :demand t
  :bind (:map evil-normal-state-map
              (",gho" . github-browse-file-non-incog))
  :init
  (progn
    (defun github-browse-file-non-incog ()
      (interactive)
      (let ((browse-url-generic-args nil))
        (github-browse-file)))))
