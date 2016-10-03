(let ((default-directory  "~/.emacs.d/modules/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/config")
(eval-when-compile (require 'use-package))

(load "config-basics.el")
(load "config-ace-jump.el")
(load "config-magit.el")
(load "config-elisp.el")
(load "config-projectile.el")
(load "config-smex.el")
(load "config-undo-tree.el")
(load "config-ido.el")
(load "config-ag.el")


