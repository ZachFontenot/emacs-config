;;; go-config.el -- Golang Mode configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package go-mode
  :ensure t
  :hook
  (go-mode . (lambda () (setq tab-width 2 indent-tabs-mode 1))))

(provide 'go-config)
;;; racket-config.el ends here
