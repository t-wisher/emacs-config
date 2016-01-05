;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'js2-mode)
(add-to-list 'auto-mode-alist '(".jscsrc" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)

(flycheck-def-config-file-var flycheck-jscs javascript-jscs ".jscs.json"
  :safe #'stringp)

(flycheck-define-checker javascript-jscs
  "A JavaScript code style checker.
See URL `https://github.com/mdevils/node-jscs'."
  :command ("jscs" "--reporter" "checkstyle" "--esnext"
            (config-file "--config" flycheck-jscs)
            source)
  :error-parser flycheck-parse-checkstyle
  :modes (js-mode js2-mode js3-mode)
  :next-checkers (javascript-jshint))

(add-to-list 'flycheck-checkers 'javascript-jscs)

(require 'js-comint)

(add-hook 'js2-mode-hook '(lambda ()
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)
				(setq flycheck-check-syntax-automatically '(save mode-enabled))
				(setq-default indent-tabs-mode nil)))

(provide 'js-config)

;;; js-config.el ends here
