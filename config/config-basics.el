;; entry-point
;; load the basics, set evil-mode, override some built-in emacs vars

;;(require 'diminish) ;;FIXME enable

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; it's madness to have an independent $PATH for emacs:
(use-package exec-path-from-shell :config (exec-path-from-shell-initialize))

;; Good colors, less clutter
(require 'solarized-dark-theme)
(load-theme 'solarized-dark t)
(menu-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; FIXME find a better font
(let ((font "Menlo:pixelsize=14"))
  (set-face-attribute 'default nil :font font)
  (set-frame-font font nil t))
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(require 'bind-key)
(require 'evil)
(evil-mode 1)
(setq-default truncate-lines t)
(setq evil-move-cursor-back nil)

(use-package evil-surround :config (global-evil-surround-mode 1))

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

;; Now, we want VIM motions to work everywhere...
;; according to the docs: https://www.emacswiki.org/emacs/Evil
;; all we should have to do is customize the variables evil-overriding-maps and evil-intercept-maps 
;; but that does not appear to work... (e.g. edebug still wants to steal the motion keys)
;; so stuffing pretty much everything in evil-motion-state-modes
;; still looking for the perfect solution...
;; magit is handled separately in evil-magit.el

(add-hook 'messages-buffer-mode-hook #'(lambda () (evil-mode)) t)
(setq evil-motion-state-modes '(archive-mode
                                bbdb-mode
                                bookmark-bmenu-mode
                                bookmark-edit-annotation-mode
                                browse-kill-ring-mode
                                bzr-annotate-mode
                                calc-mode
                                cfw:calendar-mode
                                completion-list-mode
                                Custom-mode
                                custom-theme-choose-mode
                                debugger-mode
                                delicious-search-mode
                                desktop-menu-blist-mode
                                desktop-menu-mode
                                doc-view-mode
                                dvc-bookmarks-mode
                                dvc-diff-mode
                                dvc-info-buffer-mode
                                dvc-log-buffer-mode
                                dvc-revlist-mode
                                dvc-revlog-mode
                                dvc-status-mode
                                dvc-tips-mode
                                ediff-mode
                                ediff-meta-mode
                                efs-mode
                                Electric-buffer-menu-mode
                                emms-browser-mode
                                emms-mark-mode
                                emms-metaplaylist-mode
                                emms-playlist-mode
                                etags-select-mode
                                fj-mode
                                gc-issues-mode
                                gdb-breakpoints-mode
                                gdb-disassembly-mode
                                gdb-frames-mode
                                gdb-locals-mode
                                gdb-memory-mode
                                gdb-registers-mode
                                gdb-threads-mode
                                gist-list-mode
                                gnus-article-mode
                                gnus-browse-mode
                                google-maps-static-mode
                                ibuffer-mode
                                jde-javadoc-checker-report-mode
                                mh-folder-mode
                                monky-mode
                                notmuch-hello-mode
                                notmuch-search-mode
                                notmuch-show-mode
                                occur-mode
                                org-agenda-mode
                                package-menu-mode
                                proced-mode
                                rcirc-mode
                                rebase-mode
                                recentf-dialog-mode
                                reftex-select-bib-mode
                                reftex-toc-mode
                                sldb-mode
                                slime-inspector-mode
                                slime-thread-control-mode
                                slime-xref-mode
                                sr-buttons-mode
                                sr-mode
                                sr-tree-mode
                                sr-virtual-mode
                                tar-mode
                                tetris-mode
                                tla-annotate-mode
                                tla-archive-list-mode
                                tla-bconfig-mode
                                tla-bookmarks-mode
                                tla-branch-list-mode
                                tla-browse-mode
                                tla-category-list-mode
                                tla-changelog-mode
                                tla-follow-symlinks-mode
                                tla-inventory-file-mode
                                tla-inventory-mode
                                tla-lint-mode
                                tla-logs-mode
                                tla-revision-list-mode
                                tla-revlog-mode
                                tla-tree-lint-mode
                                tla-version-list-mode
                                twittering-mode
                                urlview-mode
                                vc-annotate-mode
                                vc-dir-mode
                                vc-git-log-view-mode
                                vc-svn-log-view-mode
                                vm-mode
                                vm-summary-mode
                                w3m-mode
                                wab-compilation-mode
                                xgit-annotate-mode
                                xgit-changelog-mode
                                xgit-diff-mode
                                xgit-revlog-mode
                                xhg-annotate-mode
                                xhg-log-mode
                                xhg-mode
                                xhg-mq-mode
                                xhg-mq-sub-mode
                                xhg-status-extra-mode

                                apropos-mode
                                Buffer-menu-mode
                                calendar-mode
                                color-theme-mode
                                command-history-mode
                                compilation-mode
                                dictionary-mode
                                ert-results-mode
                                help-mode
                                Info-mode
                                Man-mode
                                speedbar-mode
                                undo-tree-visualizer-mode
                                view-mode woman-mode))
