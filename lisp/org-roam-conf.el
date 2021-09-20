;;; org-roam-conf.el --- Org Roam config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org-roam")
  (org-roam-completion_everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (org-roam-setup)
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))

(provide 'org-roam-conf)
;;; org-roam-conf.el ends here
