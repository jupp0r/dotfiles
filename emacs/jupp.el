; disable autosave
(setq make-backup-files nil)

; stop creating those backup~ files
(setq make-backup-files nil)
; stop creating those #auto-save# files
(setq auto-save-default nil)

; allow for German umlauts via Alt-U <letter>
(setq mac-option-modifier nil)
(setq mac-function-modifier 'meta)
; I'm on the tab side of the force
; http://www.jwz.org/doc/tabs-vs-spaces.html for details
(setq indent-tabs-mode t)
(setq c-basic-offset 2)
(setq tab-width 2)

; erlang mode
(let ((erlang-emacs-dir "/usr/local/Cellar/erlang/R14B04/lib/erlang/lib/tools-2.6.6.5/emacs"))
    (when (file-exists-p erlang-emacs-dir)
            (add-to-list 'load-path erlang-emacs-dir)
            (setq erlang-root-dir "/usr/local/Cellar/erlang/R14B04")
            (setq exec-path (cons "/usr/local/Cellar/erlang/R14B04/bin" exec-path))
            (require 'erlang-start)
            (require 'erlang-eunit)
            (add-hook 'erlang-mode-hook
                      '(lambda ()
                         (local-set-key (kbd "C-c C-t")
                                        '(lambda ()
                                           (interactive)
                                           (save-buffer)
                                           (erlang-eunit-compile-and-run-module-tests)))))))

; window startup size
(add-to-list 'default-frame-alist '(left . 70))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 155))

; cursor as bar
(add-to-list 'default-frame-alist '(cursor-type . box))

; rsense
(let ((rsense-home-dir "/usr/local/Cellar/rsense/0.3/libexec"))
    (when (file-exists-p rsense-home-dir)
        (setq rsense-home rsense-home-dir)
        (add-to-list 'load-path (concat rsense-home-dir "/etc"))
        (require 'rsense)))

; auto-complete-clang
(let ((auto-complete-dir (concat prelude-vendor-dir "/auto-complete")))
    (setq ac-dictionary-directories ())
    (add-to-list 'ac-dictionary-directories (concat auto-complete-dir "/dict"))
    (require 'auto-complete-config)
    (ac-config-default))

; clang autocomplete
(let ((auto-complete-clang-dir (concat prelude-vendor-dir "/auto-complete-clang")))
    (add-to-list 'load-path auto-complete-clang-dir)
    (require 'auto-complete-clang))

; tab stops
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default ruby-basic-offset 2)

; start edit server, allows to edit stuff in browser in emacs
(require 'edit-server)
(edit-server-start)

;; colorize compilation buffer
(require 'ansi-color)
(setq ansi-color-for-comint-mode t)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; don't ask for compilation command
(setq compilation-read-command nil)

;; compile key
(defun c-w-c ()
  (interactive)
  (setq current-prefix-arg '(4))
  (call-interactively 'compile))
(global-set-key (kbd "C-x c") 'c-w-c)

;; no sound, but visible bell
(setq-default visible-bell t)

;; auto-scroll compilation buffer
(setq compilation-scroll-output t)
(setq compile-auto-highlight t)

;; turn on font-lock mode
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(prefer-coding-system 'utf-8)

(setq font-lock-unfontify-region-function 'ansi-color-unfontify-region)

;; workgroups
(setq wg-prefix-key (kbd "C-z"))
(workgroups-mode 1)
(wg-load "~/.workgroups")
