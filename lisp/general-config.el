;;; general-config.el -- Applicable Everywhere -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (use-package fira-code-mode
;;   :ensure t
;;   :config (global-fira-code-mode))

;; Completions
(use-package corfu
  :ensure t
  :bind
  (:map corfu-map ("SPC" . corfu-insert-separator))
  :custom
  (corfu-auto nil)
  :hook (prog-mode . corfu-mode)
  :init
  (setq tab-always-indent 'complete))

;; Error Checking
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

;; (use-package company
;;   :ensure t
;;   :init
;;   (global-company-mode)
;;   :custom
;;   (company-idle-delay 0.5)
;;   (company-minimum-prefix-length 3)
;;   :bind
;;   (:map company-active-map
;;         ("C-n" . company-select-next)
;;         ("C-p" . company-select-previous)
;;         ("M-<" . company-select-first)
;;         ("M->" . company-select-last)))

;; Eshell local, currently not different
;; (add-hook 'eshell-mode-hook
;;           (lambda ()
;;             (setq-local corfu-auto nil)
;;             (corfu-mode)))

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  :ensure t
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package savehist
  :ensure t
  :init
  (savehist-mode))

(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode)
  (show-smartparens-global-mode +1)
  :config
  (require 'smartparens-config)
  (setq sp-base-key-bindings 'paredit
        sp-autoskip-closing-pair 'always
        sp-hybrid-kill-entire-symbol nil)
  (sp-use-paredit-bindings)
  :diminish smartparens-mode
  ;; Elixir and Corfu eat each other.
  ;; So remember to use C-Return for Yas
  :custom
  (sp-local-pair 'elixir-mode "def" nil :actions :rem)
  (sp-local-pair 'elixir-mode "defp" nil :actions :rem)
  (sp-local-pair 'elixir-mode "case" nil :actions :rem)
  (sp-local-pair 'elixir-mode "with" nil :actions :rem)
  )

(use-package crux
  :ensure t
  :bind (("C-c s" . crux-swap-windows)
         ("C-a" . crux-move-beginning-of-line)))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rg
  :ensure t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)))

(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :ensure t)

(use-package yasnippet
  :ensure t
  :bind (:map yas-minor-mode-map ("<C-return>" . yas-expand))
  )

(use-package yasnippet-snippets
  :ensure t)

(provide 'general-config)
;;; general-config.el ends here
