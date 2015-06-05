;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'rbenv)
(global-rbenv-mode)

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

(require 'bundler)

(require 'rspec-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(require 'ruby-guard)

(require 'ruby-tools)

(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

(provide 'ruby-config)

;;; ruby-config.el ends here
