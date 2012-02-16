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
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default ruby-basic-offset 2)

; start edit server, allows to edit stuff in browser in emacs
(require 'edit-server)
(edit-server-start)

;; don't ask for compilation command
(setq compilation-read-command nil)

;; compile key, maybe a little dangerous so close to quit
(global-set-key (kbd "C-c c") 'compile)

;; no sound, but visible bell
(setq-default visible-bell t)

(prefer-coding-system 'utf-8)

(setq font-lock-unfontify-region-function 'ansi-color-unfontify-region)

;; workgroups
;; this is a really ugly fix for a broken el-get recipe for workgroups
(let ((workgroup-install-dir "/Users/jupp/.emacs.d/el-get/workgroups")
      (workgroup-custom-setting-file "/Users/jupp/.workgroups/beleg"))
  (when (file-exists-p workgroup-install-dir)
    (add-to-list 'load-path workgroup-install-dir)
    (require 'workgroups)
    (setq wg-prefix-key (kbd "C-z"))
    (workgroups-mode 1)
    (when (file-exists-p workgroup-custom-setting-file)
      (wg-load workgroup-custom-setting-file))))

;; I use google C coding style
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; fix whitespace-slowdown
(defun whitespace-post-command-hook() nil)

;; homebrew path
(push "/usr/local/bin" exec-path)

;; no scroll bars
(scroll-bar-mode -1)

;; smoother scrolling
 (setq scroll-step           1
       scroll-conservatively 10000)
