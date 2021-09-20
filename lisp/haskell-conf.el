;;; haskell-conf.el --- Setup for Haskell programming language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package haskell-mode
  :ensure t
  :hook
  (haskell-mode . interactive-haskell-mode))

(use-package ormolu
  :ensure t
  :hook (haskell-mode . ormolu-format-on-save-mode)
  :bind
  (:map haskell-mode-map
        ("C-c r" . ormolu-format-buffer)))

(provide 'haskell-conf)
;;; haskell-conf.el ends here
