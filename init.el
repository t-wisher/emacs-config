;; setup cask and pallet to manage dependencies
;; they are installed differently depending on osx or linux
;; so create a cask-location variable to store the location in
(if (eq system-type 'darwin)
  (defvar cask-location "/usr/local/Cellar/cask/0.7.2/cask.el"))

(if (eq system-type 'gnu/linux)
  (defvar cask-location "~/.cask/cask.el")
  (setenv "ESHELL" (expand-file-name "~/bin/eshell")))

(require 'cask cask-location)
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; remove gui elements
(if window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
(setq inhibit-startup-message t)

;; maximize window on startup
(toggle-frame-maximized)

;; display line numbers
(global-linum-mode t)

;; use sanityinc tomorrow theme
(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow--define-theme night)

;; configure package repos for emacs
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
    '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; enable projectile
(projectile-global-mode)

;; ido everywhere
(ido-mode)
(ido-everywhere 1)
(setq ido-case-fold t)
(setq ido-auto-merge-work-directories-length -1) ;; stop ido from preventing creation of new directories in dired

;; vertical ido completion
(setq ido-decorations (quote ("\n-> " "" "\n  " "\n  ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys ()
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; auto-completion with company-mode
(global-company-mode t)
(push 'company-robe company-backends)

;; enable smartparens
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)

;; enable magit
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0") ;; disable message that shows on startup

;; smex for ido on M-x
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(add-to-list 'load-path "~/.emacs.d/config")
(require 'ruby-config)

;; golang packages
(add-to-list 'load-path "~/projects/golang/src/github.com/dougm/goflymake")
(require 'go-flymake)
(require 'company-go)
(require 'go-errcheck)

(setenv "GOPATH" "~/projects/golang")
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "~/projects/golang/bin")

;; company autocompletion improvements
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; js2-mode
(require 'js2-mode)
(require 'js-comint)
(add-hook 'js2-mode-hook '(lambda () 
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)
			    ))

;; get environment variables from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "GOPATH")
