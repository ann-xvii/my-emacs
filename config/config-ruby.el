;; some hints here:
;; http://lorefnon.me/2014/02/02/configuring-emacs-for-rails.html

;; (use-package web-mode
;;   :config
;;   (progn
;;     (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))))

;; (use-package flymake-ruby
;;   :config
;;   (progn
;;     (add-hook 'ruby-mode-hook 'flymake-ruby-load)))

;; replace symbol or region with same eval'd in ruby
(global-set-key
 (kbd "s-=")
 (lambda () (interactive)
   (let* ((bounds (if (use-region-p)
                      (cons (region-beginning) (region-end))
                    (bounds-of-thing-at-point 'symbol)))
          (text   (buffer-substring-no-properties (car bounds) (cdr bounds))))
     (when bounds
       (delete-region (car bounds) (cdr bounds))
       (insert (shell-command-to-string
                (string-join (list "ruby -e \"print(eval(\\\"" (s-trim-right text) "\\\"))\""))))))))

(use-package rvm :demand t)

(use-package robe

  :demand t
  
  :init
  (progn
    (setq ruby-deep-indent-paren nil) ;; indent inside parens just like anywhere else

    (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
      (rvm-activate-corresponding-ruby))

    (evil-define-key 'normal robe-mode-map (kbd "g f") 'robe-jump)
    (evil-define-key 'normal robe-mode-map (kbd "g d") 'robe-doc)
    
    (eval-after-load 'company
      '(add-to-list 'company-backends 'company-robe))

    (add-hook 'ruby-mode-hook 'robe-mode))

  :config
  (progn
    ;; (diminish 'robe-mode " R0β3")
    (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
    (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
    (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
    (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
    (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
    (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))

    ))

