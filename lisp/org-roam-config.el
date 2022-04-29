;;; org-roam-config.el --- Org-Roam -*- lexical binding: t; -*-
;;; Commentary:
;;; Org Roam and things
;;; Code:

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org-roam"))
  (find-file-visit-truename t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup)
  (org-roam-db-autosync-mode))

(provide 'org-roam-config)
;;; org-roam-config.el ends here
