(use-package inf-mongo

  :bind (:map evil-normal-state-map
              (",,miparw" . mongo-shell-parw)
              (",,miparo" . mongo-shell-paro)
              (",,miperw" . mongo-shell-perw)
              (",,miprw"  . mongo-shell-prw)
              (",,mipsro" . mongo-shell-psro)
              (",,mipro"  . mongo-shell-pro)
              (",,mid"    . mongo-shell-d)
              (",,mi2d"   . mongo-shell-2d)
              (",,mils"   . mongo-shell-ls)
              (",,mist"   . mongo-shell-st)
              (",,misb"   . mongo-shell-sb))

  :init
  (progn
    ;;FIXME THIS IS NOT WORKING AND IT'S ANNOYING
    ;; is there some special handling of defvar for use-package, or what?

    ;; global copy of the buffer-local variable
    (defvar inf-mongo-comint-input-ring nil)
    (defun set-inf-mongo-comint-input-ring ()
      (make-local-variable 'kill-buffer-hook) ;; create a buffer-local binding of kill-buffer-hook
      (add-hook 'kill-buffer-hook #'save-inf-mongo-comint-input-ring) ;; save the value of comint-input-ring when this buffer is killed
      (when inf-mongo-comint-input-ring ;; restore saved value (if available)
        (message "Restoring comint-input-ring for inf-mongo...")
        (setq comint-input-ring inf-mongo-comint-input-ring)))
    (defun save-inf-mongo-comint-input-ring ()
      (message "Saving comint-input-ring...")
      (setq inf-mongo-comint-input-ring comint-input-ring))
    )

  :config
  (progn

    (add-hook 'inf-mongo-mode-hook #'set-inf-mongo-comint-input-ring)

    (load "~/.emacs.d/sensitive.el")
    
    (defun mongo-shell-parw () (interactive) (inf-mongo mongo-aussie))
    (defun mongo-shell-paro () (interactive) (inf-mongo mongo-aussie-secondary          ))
    (defun mongo-shell-perw () (interactive) (inf-mongo mongo-iris-prod-eu-rw           ))
    (defun mongo-shell-prw  () (interactive) (inf-mongo mongo-iris-prod-rw              ))
    (defun mongo-shell-psro () (interactive) (inf-mongo mongo-iris-prod-slave-read-only ))
    (defun mongo-shell-pro  () (interactive) (inf-mongo mongo-iris-prod-read-only       ))
    (defun mongo-shell-d    () (interactive) (inf-mongo mongo-iris-dev                  ))
    (defun mongo-shell-2d   () (interactive) (inf-mongo mongo-iris-dev2                 ))
    (defun mongo-shell-ls   () (interactive) (inf-mongo mongo-iris-local-staging        ))
    (defun mongo-shell-st   () (interactive) (inf-mongo mongo-iris-staging              ))
    (defun mongo-shell-sb   () (interactive) (inf-mongo mongo-iris-sandbox              ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; based on http://emacs.stackexchange.com/questions/4221/remembering-history-between-sessions-in-inferior-emacs-lisp-mode
    ;; persist inf-mongo comint input ring (history) between sessions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    
    ))
