;;; setup.el --- Setup -*- lexical binding: t; -*-
;;; Commentary:
;;; Basically anything universal that isn't specific and doesn't require much config.
;;; Code:

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

;; Mac shell setup
(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(defun get-default-height ()
  "Set window height."
  (/ (- (display-pixel-height) 120)
     (frame-char-height)))

(add-to-list 'default-frame-alist '(width . 200))
(add-to-list 'default-frame-alist (cons 'height (get-default-height)))

;; This fixes scrolling in child frames
(setq mouse-wheel-scroll-amount '(2 ((shift) . hscroll)
                                    ((meta))
                                    ((control)
                                     .text-scale)))

;; Graphical stuff and niceties.
(setq inhibit-startup-message t)
(global-linum-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq ring-bell-function 'ignore)

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(setq-default indent-tabs-mode nil)

(use-package doom-modeline
  :ensure t
  :config
  (require 'all-the-icons)
  (setq doom-modeline-height 15))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-org-config))


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
  :diminish smartparens-mode)

(use-package crux
  :ensure t
  :bind (("C-c s" . crux-swap-windows)
         ("C-a" . crux-move-beginning-of-line)))

;; I imagine this will blow up without the font installed
(set-face-attribute 'default nil
                    :family "Hasklig"
                    :height 200
                    :weight 'normal
                    :width 'normal)

(use-package hasklig-mode
  :ensure t
  :hook (haskell-mode elixir-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; These packages are all quality of life, don't require much config, although they could be in their
;; own files, I suppose.
(use-package rg
  :ensure t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package company
  :ensure t
  :init
  (global-company-mode)
  :custom
  (company-idle-delay 0.5) ;; popup time
  (setq company-minimum-prefix-length 1)
  :bind
  (:map company-active-map
	("C-n" . company-select-next)
	("C-p" . company-select-previous)
	("M-<" . company-select-first)
	("M->" . company-select-last)))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)))

(provide 'setup)
;;; setup.el ends here
