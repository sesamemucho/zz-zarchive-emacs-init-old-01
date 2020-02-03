;;; init.el --- emacs initialization file
;; -*- lexical-binding: t; -*-

;; From:
;; Copyright (C) 2017-2018 Adam Taylor

;;; Commentary:
;;      This file is documented in config.org
;;

;;; Code:
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)
(prefer-coding-system 'utf-8)
;; (unless (boundp 'package-user-dir)
;;   (unless (boundp 'package-archive-contents)
;;     (package-initialize))
;;   (unless (assoc 'use-package package-archive-contents)
;;     (package-refresh-contents)
;;     (package-install (elt (cdr (assoc 'org-plus-contrib package-archive-contents)) 0))
;;     (package-install (elt (cdr (assoc 'use-package package-archive-contents)) 0))))
;; (assoc-delete-all 'org package--builtins)
(add-to-list 'load-path (expand-file-name "startup/use-package" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "startup/bind-key" user-emacs-directory))
(require 'use-package)
(setq use-package-always-ensure nil)
(use-package org)
;;(defcustom ssmm/cfg-file (concat user-emacs-directory "config")
(setq ssmm/cfg-dir "/home/bob/.emacs.d/")
(setq ssmm/cfg-file (concat ssmm/cfg-dir "config"))
;;  "The base name for the .org file to use for Emacs initialization.")
(when (file-newer-than-file-p (concat ssmm/cfg-file ".org") (concat ssmm/cfg-file ".el"))
  (org-babel-tangle-file (concat ssmm/cfg-file ".org")))
(load ssmm/cfg-file)
;; Local Variables:
;; byte-compile-warnings: (not free-vars noruntime)
;; End:
;;; init.el ends here
