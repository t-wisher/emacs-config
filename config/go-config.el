;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'go-errcheck)

(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "~/projects/golang/bin")

(add-to-list 'load-path "~/.emacs.d/config")
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(add-hook 'before-save-hook #'gofmt-before-save)

(provide 'go-config)

;;; go-config.el ends here
