;; check for packages and install if needed
(defvar jupp-packages
  '(cmake-mode workgroups haml-mode))

(dolist (p jupp-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; disable autosave
(setq make-backup-files nil)

;; stop creating those backup~ files
(setq make-backup-files nil)
;; stop creating those #auto-save# files
(setq auto-save-default nil)

(when (equal window-system 'ns)
  (setq mac-option-modifier nil)
  (setq mac-function-modifier 'meta))

;; erlang mode
(let ((erlang-emacs-dir "/usr/local/Cellar/erlang/R15B/lib/erlang/lib/tools-2.6.6.6/emacs"))
    (when (file-exists-p erlang-emacs-dir)
            (add-to-list 'load-path erlang-emacs-dir)
            (setq erlang-root-dir "/usr/local/Cellar/erlang/R15B")
            (setq exec-path (cons "/usr/local/Cellar/erlang/R15B/bin" exec-path))
            (require 'erlang-start)
            (require 'erlang-eunit)
            (add-hook 'erlang-mode-hook
                      '(lambda ()
                         (local-set-key (kbd "C-c C-t")
                                        '(lambda ()
                                           (interactive)
                                           (save-buffer)
                                           (erlang-eunit-compile-and-run-module-tests)))))))

;; restore arrow key navigation
(prelude-restore-arrow-keys)

;; get terminal colors for cmake builds
(add-to-list 'compilation-environment "EMACS=n")

;; cmake mode
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

;; scroll to compilation buffer bottom
(setq-default compilation-scroll-output t)

;; cursor as red bar
(add-to-list 'default-frame-alist '(cursor-type . bar))
(set-cursor-color "red")

;; rsense
(let ((rsense-home-dir "/usr/local/Cellar/rsense/0.3/libexec"))
    (when (file-exists-p rsense-home-dir)
        (setq rsense-home rsense-home-dir)
        (add-to-list 'load-path (concat rsense-home-dir "/etc"))
        (require 'rsense)))

;; tab stops
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(setq-default ruby-basic-offset 2)

(setq safe-local-variable-values
      (quote
       ((ruby-compilation-executable . "ruby")
        (ruby-compilation-executable . "ruby1.8")
        (ruby-compilation-executable . "ruby1.9")
        (ruby-compilation-executable . "rbx")
        (ruby-compilation-executable . "jruby")
        (compile-command . "cd ../build && cmake -Denable_testing=ON -DCMAKE_BUILD_TYPE:STRING=Debug .. && make && tests/alltests --gtest_color=yes 2> /dev/null"))))

;; don't ask for compilation command
(setq compilation-read-command nil)

;; compile key, maybe a little dangerous so close to quit
(defun c-w-c ()
  (interactive)
  (setq current-prefix-arg '(4))
  (call-interactively 'compile))
(global-set-key (kbd "C-c c") 'c-w-c)

;; no sound, but visible bell
(setq ring-bell-function 'ignore)

(prefer-coding-system 'utf-8)

;; ansi color hack
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; I use google C coding style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; fix whitespace-slowdown
(defun whitespace-post-command-hook() nil)

;; require final newlines
(setq require-final-newline t)

;; auto newline, hungry delete, etc
(defun set-c-mode-auto-stuff ()
  (c-toggle-electric-state 1)
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state 1)
  (subword-mode 1)
  (c-toggle-syntactic-indentation 1))
(add-hook 'c-mode-common-hook 'set-c-mode-auto-stuff)

;; disable flyspell for programming modes
(defun disable-flyspell ()
  (flyspell-mode 0))
(add-hook 'c-mode-common-hook 'disable-flyspell)

;; homebrew path
(push "/usr/local/bin" exec-path)

;; no scroll bars
(scroll-bar-mode -1)

;; smoother scrolling
(setq scroll-step           1
      scroll-conservatively 10000)


(when (equal window-system 'ns)
    ;; workgroups
  (require 'workgroups)
  (let ((workgroup-custom-setting-file "/Users/jupp/.workgroups/beleg"))
    (setq wg-prefix-key (kbd "C-z"))
    (workgroups-mode 1)
    (when (file-exists-p workgroup-custom-setting-file)
      (wg-load workgroup-custom-setting-file)))

  ;; maximize in the end
  (ns-toggle-fullscreen))
