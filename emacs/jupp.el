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
            (require 'erlang-start)))


; window startup size
(add-to-list 'default-frame-alist '(left . 70))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 155))

; cursor as bar
(add-to-list 'default-frame-alist '(cursor-type . box))

(let ((rsense-home-dir "/usr/local/Cellar/rsense/0.3/libexec"))
    (when (file-exists-p rsense-home-dir)
        (setq rsense-home rsense-home-dir)
        (add-to-list 'load-path (concat rsense-home-dir "/etc"))
        (require 'rsense)))

(let ((auto-complete-dir (concat prelude-vendor-dir "/auto-complete")))
    (setq ac-dictionary-directories ())
    (add-to-list 'ac-dictionary-directories (concat auto-complete-dir "/dict"))
    (require 'auto-complete-config)
    (ac-config-default))
