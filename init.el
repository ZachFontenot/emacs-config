;;; init.el --- Basic Setup -*- lexical-binding: t -*-
;;; Commentary:
;; Doing things and setting up package system, bootstrapping use-package and loading other configurations
;;; Code:
;; (server-start) -> while working on it.

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
(require 'setup)

(require 'vertico-conf)

(require 'consult-conf)

(require 'org-roam-conf)

;; Language things
(require 'lsp-conf)

(require 'haskell-conf)

(require 'elixir-conf)

(provide 'init)
;;; init.el ends here
