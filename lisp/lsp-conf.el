;;; lsp-conf.el --- Setup for Language Server Protocol -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom
  ;;  (lsp-eldoc-render-all t)
  (lsp-eldoc-hook nil)
  (lsp-enable-file-watchers nil)
  (lsp-idle-delay 0.6)
  :hook (elixir-mode . lsp))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-sideline-enable t)
  (lsp-ui-doc-enable t)
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-always-show t)
  :hook (lsp-mode . lsp-ui-mode))

(provide 'lsp-conf)
;;; lsp-conf.el ends here
