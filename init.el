;;; init.el --- Basic Setup -*- lexical-binding: t -*-
;;; Commentary:
;; Doing things and setting up package system, bootstrapping use-package and loading other configurations
;;; Code:
(server-start) ;; -> while working on it.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(fset 'yes-or-no-p 'y-or-n-p)

;; General things
(require 'setup-config)

(require 'general-config)

(require 'consult-config)

(require 'elixir-config)

(require 'racket-config)

(require 'go-config)

(require 'org-roam-config)

(require 'ocaml-config)

;; ;; Language things
(require 'lsp-config)

(require 'typescript-config)
;; (require 'haskell-conf)


(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))

;; (setq auto-mode-alist
;;       (append
;;        '(("\\.lagda.md\\'" . agda2-mode))))

(require 'idris-config)
;; (use-package idris-mode
;;   :config
;;   (setq idris-interpreter-path "idris2"))

(use-package sml-mode
  :ensure t)

(provide 'init)
;;; init.el ends here
