(use-package ace-jump-mode

  ;; autoload when SPC is pressed in evil normal state
  :commands ace-jump-two-chars-mode

  :init
  (bind-key "SPC" 'ace-jump-two-chars-mode evil-normal-state-map)

  :config
  (progn
    (defun ace-jump-two-chars-mode (query-char query-char-2)
      "AceJump two chars mode"
      (interactive (list (read-char "First Char:")
			 (read-char "Second:")))
      
      (if (eq (ace-jump-char-category query-char) 'other)
	  (error "[AceJump] Non-printable character"))
      
      ;; others : digit , alpha, punc
      (setq ace-jump-query-char query-char)
      (setq ace-jump-current-mode 'ace-jump-char-mode)
      (ace-jump-do (regexp-quote (concat (char-to-string query-char)
					 (char-to-string query-char-2))))))

  ;:bind ("SPC" . ace-jump-mode)
  )
