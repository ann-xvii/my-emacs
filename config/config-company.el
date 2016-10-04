;; http://company-mode.github.io/

(use-package company

  :config
  (progn
    (global-company-mode)
    (add-hook 'cider-repl-mode-hook #'company-mode)
    (add-hook 'cider-mode-hook #'company-mode)
    (setq company-idle-delay 0.5)
    (setq company-tooltip-limit 10)
    (setq company-minimum-prefix-length 2)
    (setq company-tooltip-flip-when-above t)

    ;;(add-to-list 'company-backends 'company-c-headers)
    ;;(setq company-backends (delete 'company-semantic company-backends))
    ;;(define-key c-mode-map  [(tab)] 'company-complete)
    ;;(define-key c++-mode-map  [(tab)] 'company-complete)

    ;(require 'cl-lib)
    ;(require 'company)

    ;(defun vmd-company-backend (command &optional arg &rest ignored)
    ;  (interactive (list 'interactive))

    ;  (cl-case command
    ;    (interactive (company-begin-backend 'company-sample-backend))
    ;    (prefix (and (eq major-mode 'fundamental-mode)
    ;                 (company-grab-symbol)))
    ;    (candidates
    ;     (cl-remove-if-not
    ;      (lambda (c) (string-prefix-p arg c))
    ;      vmd-mode-github-emojis-list))))

    ;(add-to-list 'company-backends 'vmd-company-backend)
    
    (defun indent-or-complete ()
      (interactive)
      (if (looking-at "\\_>")
          (company-complete-common)
        (indent-according-to-mode)))

    (global-set-key "\t" 'indent-or-complete)))


;'(add-to-list 'company-backends 'company-ghc)

;(defcustom company-clang-executable
;  (executable-find "clang-3.7")
;  "Location of clang executable."
;  :type 'file)

;;(require 'company-clang)
;(require 'company-c-headers)

;;'(add-to-list 'company-backends 'company-robe)
