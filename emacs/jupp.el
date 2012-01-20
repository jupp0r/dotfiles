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
(setq load-path (cons  "/usr/local/Cellar/erlang/R14B04/lib/erlang/lib/tools-2.6.6.5/emacs" load-path))
(setq erlang-root-dir "/usr/local/Cellar/erlang/R14B04")
(setq exec-path (cons "/usr/local/Cellar/erlang/R14B04/bin" exec-path))
(require 'erlang-start)