;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; colorize css
(setq web-mode-enable-css-colorization t)

;; web-mode auto-completion
(setq web-mode-ac-sources-alist
	  '(("css" . (ac-source-css-property))
		("html" . (ac-source-words-in-buffer ac-source-abbrev))))

;; auto-indent in web-mode
(local-set-key (kbd "RET") 'newline-and-indent)

;; Indent before CSS and JS code in <style> and <script> tags
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(provide 'web-config)

;;; web-config.el ends here
