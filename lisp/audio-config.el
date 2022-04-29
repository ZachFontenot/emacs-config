;;; audio-config.el -- Attempting to play music from Emacs -*- lexical-binding: t -*-
;;; Commentary:
;; Currently doesn't work, so oh well I guess
;;; Code:
(use-package emms
  :ensure t)

(require 'emms-setup)
(emms-all)
(emms-default-players)

(define-emms-simple-player afplay '(file)
  (regexp-opt '(".mp3" ".m4a" ".aac"))
  "afplay")
(add-to-list 'emms-player-list emms-player-afplay)
;;; audio-config.el ends here
