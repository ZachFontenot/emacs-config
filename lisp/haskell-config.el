;;; haskell-config.el --- Setup for Haskell programming language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package haskell-mode
  ;;:ensure t
  :hook
  (haskell-mode . interactive-haskell-mode))

(use-package lsp-haskell
  :defer t
  :ensure t)

(use-package ormolu
  :ensure t
  :hook (haskell-mode . ormolu-format-on-save-mode)
  :bind
  (:map haskell-mode-map
        ("C-c r" . ormolu-format-buffer)))

(provide 'haskell-config)
;;; haskell-config.el ends here
