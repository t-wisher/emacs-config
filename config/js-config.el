;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'js-comint)
(add-hook 'js2-mode-hook '(lambda ()
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)))

(provide 'js-config)

;;; js-config.el ends here
