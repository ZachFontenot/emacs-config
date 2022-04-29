;;; ocaml-config.el --- Configuration for OCaml language support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(defun in-nix-shell-p ()
  "Check to see if we are using Nix - this only matters for OCaml really."
  (string-equal (getenv "IN_NIX_SHELL") "1"))

(setq zf/merlin-site-elisp (getenv "MERLIN_SITE_LISP"))
(setq zf/utop-site-elisp (getenv "UTOP_SITE_LISP"))
(setq zf/ocp-site-elisp (getenv "OCP_INDENT_SITE_LISP"))

(use-package merlin
  :if (and zf/merlin-site-elisp
           (in-nix-shell-p))
  :load-path zf/merlin-site-elisp
  :hook
  (tuareg-mode . merlin-mode)
  :custom
  (merlin-command "ocamlmerlin"))

(use-package utop
  :if (and zf/utop-site-elisp
           (in-nix-shell-p))
  :load-path zf/utop-site-elisp
  :hook
  (tuareg-mode . utop-minor-mode))

(use-package ocp-indent
  :if (and zf/ocp-site-elisp
           (in-nix-shell-p))
  :load-path zf/ocp-site-elisp)

(provide 'ocaml-config)
;;; ocaml-config.el ends here
