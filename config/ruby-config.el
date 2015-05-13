(require 'rbenv)
(global-rbenv-mode)

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

(require 'bundler)

(require 'rspec-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(require 'ruby-guard)

(provide 'ruby-config)
