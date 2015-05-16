;;; package --- Summary
;;; Commentary:
;;; Code:
;; setup cask and pallet to manage dependencies
;; they are installed differently depending on osx or linux
;; so create a cask-location variable to store the location
(defvar cask-location "~/.cask/cask.el")
(if (eq system-type 'darwin)
  (setq cask-location "/usr/local/Cellar/cask/0.7.2/cask.el"))

(require 'cask cask-location)
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; remove gui elements and maximize window
(if window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
(scroll-bar-mode -1)
(menu-bar-mode -1)
(toggle-frame-maximized)

;; disable splash screen
(setq inhibit-startup-message t)

;; use sanityinc tomorrow theme
(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow--define-theme day)

;; configure package repos for emacs
;(require 'package)
;(add-to-list 'package-archives
;    '("marmalade" .
;      "http://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives
;    '("melpa" . "http://melpa.org/packages/") t)
;(package-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; disable autosaves and backups
(setq auto-save-default nil)
(setq make-backup-files nil)

(add-to-list 'load-path "~/.emacs.d/config")
(require 'common-config)
(require 'go-config)
(require 'js-config)
(require 'ruby-config)
(require 'web-config)

;; start emacs server
(server-start)

(provide 'init)
;;; init ends here
