;; entry-point
;; load the basics, set evil-mode, override some built-in emacs vars

;;(require 'diminish) ;;FIXME enable

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; it's madness to have an independent $PATH for emacs:
(use-package exec-path-from-shell :config (exec-path-from-shell-initialize))

(use-package hydra)

;; Good colors, less clutter
(require 'solarized-dark-theme)
(load-theme 'solarized-dark t)
(menu-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(let ((font "Inconsolata:pixelsize=16"))
  (set-face-attribute 'default nil :font font)
  (set-frame-font font nil t))
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(require 'bind-key)
(require 'evil)
(evil-mode 1)
(setq-default truncate-lines t)
(setq evil-move-cursor-back nil)

(use-package evil-surround :config (global-evil-surround-mode 1) :defer 3)

;; Follow links, use UTC-8, don't ask me to type "yes", don't use real Tab characters
(prefer-coding-system 'utf-8)
(setq vc-follow-symlinks 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)

;; Backups: keep them forever, in a separate directory, and version them
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; save and restore some history
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; some scroll adjustments
(setq scroll-margin 5
      scroll-preserve-screen-position 1)

;; x primary selection gets set by emacs whenever a region is selected
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)

;; for git-gutter?
(set-fringe-mode '(10 . 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mimic VIM for switching windows
;; I keep hitting these accidentally instead of "C-w k" etc
(define-key evil-motion-state-map (kbd "C-w C-k") 'evil-window-up)
(define-key evil-motion-state-map (kbd "C-w C-j") 'evil-window-down)
(define-key evil-motion-state-map (kbd "C-w C-h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "C-w C-l") 'evil-window-right)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; leader key = ,
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; remove default evil binding, and use it as a prefix key for core Emacs functionality
(unbind-key "," evil-motion-state-map)
(bind-keys* :map evil-normal-state-map
            :prefix-map evil-leader-prefix-map
            :prefix ","
            ("b."   . next-buffer)
            ("b,"   . previous-buffer)
            ("bl"   . buffer-menu)
            ("wd"   . delete-window)
            ("wb"   . delete-other-windows)
            ("bk"   . kill-buffer-and-window)
            ("bd"   . kill-buffer)
            (",nw"  . set-window-title)
            (",s"   . shell)
            (",x"   . smex)
            (",,x"  . smex-major-mode-commands)
            (",w"   . make-frame))

;; for some reason, the above also affects evil insert state causing it to treat , as a prefix-key
;; obviously we don't want that... this fixes it, but I do not understand why:
(bind-keys :map evil-insert-state-map
           ("," . self-insert-command))

;(add-hook 'messages-buffer-mode-hook #'(lambda () (evil-mode)) t)

; modes that should _start_ in motion-state
(setq evil-motion-state-modes '(debugger-mode apropos-mode Buffer-menu-mode calendar-mode color-theme-mode command-history-mode compilation-mode dictionary-mode ert-results-mode help-mode Info-mode Man-mode speedbar-mode undo-tree-visualizer-mode view-mode woman-mode))





;; TODO
;; learn...
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Controlling-Active-Maps.html
;; https://github.com/jwiegley/use-package
;; https://github.com/noctuid/vertigo.el
;; also this basics file is growing unwieldy

;; alternative ace-jump: https://github.com/hlissner/evil-snipe and https://github.com/bling/evil-jumper
;; the latter says evil itself includes this, but it's not evil-jump-forward...
;; but just discovered that jump-to-register is a thing, I should learn it

;; this looks kinda like lispy for C ... https://github.com/wcsmith/evil-args

;; this allows eval with motion-commands: (might be neat for shell)
;; https://github.com/Dewdrops/evil-extra-operator
