;;; elixir-conf.el --- Elixir Language Config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package elixir-mode
  :ensure t)

(add-to-list 'exec-path "~/elixir-ls-1.11.4/")

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html.eex\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html.[hl]eex\\'" . web-mode))
  (setq web-mode-engines-alist '(("elixir" . "\\html.eex\\'")
                                 ("elixir" . "\\html.[hl]eex\\'"))
        web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-pairing nil))

(provide 'elixir-conf)
;;; elixir-conf.el ends here
