;;; setup-config.el --- Setup & Graphical things -*- lexical binding: t; -*-
;;; Commentary:
;;; Disable things, graphic/ window things, etc.
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

;; Don't set default height
;;(add-to-list 'default-frame-alist '(width . 200))
;;(add-to-list 'default-frame-alist (cons 'height (get-default-height)))

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
(global-auto-revert-mode t)

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package doom-modeline
  :ensure t
  :config (require 'all-the-icons)
  :hook (after-init . doom-modeline-mode))

;;(load-theme 'modus-operandi)

(setq hl-line-mode t)

;; (use-package faff-theme
;;   :ensure t
;;   :config
;;   (load-theme 'faff))

;; (use-package hasklig-mode
;;   :ensure t;
;;   :hook (haskell-mode elixir-mode))

;; dvorak helpin
(global-set-key (kbd "C-z") ctl-x-map)
(global-set-key (kbd "C-x C-h") help-map)
(global-set-key (kbd "C-h") 'previous-line)

(set-face-attribute 'default nil
                    :family "mononoki Nerd Font Mono"
                    :height 150
                    :weight 'normal
                    :width 'normal)

(setq-default indent-tabs-mode nil)

(provide 'setup-config)
;;; setup-config.el ends here
