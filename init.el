(let ((default-directory  "~/.emacs.d/deps/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/config")

;hmm, breaking with precompiled...
;(eval-when-compile (require 'use-package))
(require 'use-package)

(load "config-basics.el")
(load "config-ace-jump.el")
(load "config-magit.el")
(load "config-elisp.el")
(load "config-projectile.el")
(load "config-smex.el")
(load "config-undo-tree.el")
(load "config-ido.el")
(load "config-ag.el")
(load "config-evil-matchit.el")
(load "config-company.el")


