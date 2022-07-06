;;; lsp-config.el -- Lsp mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t
  :after (direnv)
  :commands lsp
  :custom
  (lsp-eldoc-hook nil)
  (lsp-enable-file-watchers nil)
  (lsp-idle-delay 0.6)
  :hook (typescript-mode . lsp) (lsp-mode . lsp-lens-mode))

(advice-add 'lsp :before #'direnv-update-environment)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-sideline-enable t)
  (lsp-ui-doc-enable t)
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-always-show t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-doc-alignment 'window)
  (lsp-ui-sideline-diagnostic-max-lines 3)
  :hook (lsp-mode . lsp-ui-mode))

(provide 'lsp-config)
;;; typescript-config.el ends here
