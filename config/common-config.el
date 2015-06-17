;;; package --- Summary
;;; Commentary:
;;; Code:
(global-linum-mode t)

(setq-default tab-width 4)
(setq standard-indent 4)
(setq-default r-indent-level 4)
(setq perl-indent-level 4)

(projectile-global-mode)

(ido-mode)
(ido-everywhere 1)
(setq ido-case-fold t)
(setq ido-auto-merge-work-directories-length -1) ;; stop ido from preventing creation of new directories in dired

;; ido vertical completion
(setq ido-decorations (quote ("\n-> " "" "\n " "\n ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys ()
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; smex for ido on M-x
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; evil-mode
(require 'evil)
(evil-mode 1)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

;; smartparens
;;(require 'smartparens-config)
;;(smartparens-global-mode)
;;(show-smartparens-global-mode t)

;; try autopair
(require 'autopair)
(autopair-global-mode)

;; try electric-mode instead of smartparens
;(electric-pair-mode 1)

;; magit for git repos
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0") ;; disable message that shows on startup

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(exec-path-from-shell-copy-env "GOROOT")
(exec-path-from-shell-copy-env "GOPATH")

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(provide 'common-config)
;;; common-config.el ends here
