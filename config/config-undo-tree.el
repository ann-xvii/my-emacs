(use-package undo-tree

  :commands undo-tree-visualize
  
  :config
  (progn
    (global-undo-tree-mode t)
    (setq undo-tree-visualizer-relative-timestamps t)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-auto-save-history t)
    (setq undo-tree-visualizer-diff t)
    (setq undo-tree-history-directory-alist '((".*" . "~/.emacs.d/backups")))))
