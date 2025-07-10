;;; languages.el --- configure programming languages and language servers  -*- lexical-binding: t; -*-

;; Author:  me!
;; Keywords: languages
;;; Commentary:

;; 

;;; Code:
(use-package eglot
  :ensure t
  :commands eglot
  :config
  (setq eglot-server-programs
        '((rust-mode . ("rust-analyzer"))
          (haskell-mode . ("haskell-language-server-wrapper" "--lsp"))
          ((typescript-mode tsx-ts-mode) . ("typescript-language-server" "--stdio"))
          (python-mode . ("pylsp"))))
  (add-hook 'typescript-mode-hook #'eglot-ensure)
  (add-hook 'tsx-ts-mode-hook #'eglot-ensure))

;; python
(use-package python-black
  :ensure t
  :after python-mode)

(use-package python-docstring
  :ensure t
  :after python-mode)

(use-package anaconda-mode
  :ensure t
  :after python-mode)

(use-package python-mode
  :ensure t
  :mode "\\.py\\'"
  :hook ((python-mode . eglot-ensure)
         (python-mode . company-mode)
         (python-mode . flycheck-mode)))

;; rust
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :hook ((rust-mode . eglot-ensure)
         (rust-mode . company-mode)
         (rust-mode . flycheck-mode))
  :config
  (setq rust-format-on-save t)) ; optional, formats code on save

;; TODO defer this
(use-package yasnippet
  :ensure t
  :defer nil) ;; load immediately

(use-package js-doc
  :ensure t
  :after yasnippet
  :config
  ;; Make sure cl-lib is loaded for incf
  (require 'cl-lib))

;; typescript
(use-package typescript-mode
  :ensure t
  :defer t
  :hook
  ((typescript-mode . (lambda ()
                       ;; Enable js-doc insertion keybinding
			(evil-define-key 'normal global-map (kbd "SPC l t c") #'js-doc-insert-function-doc))))
  :config
  (use-package js-doc
    :ensure t
    :commands js-doc-insert-function-doc))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))


;; eglot boost
(straight-use-package
 '(some-package :host github :repo "jdtsmith/eglot-booster"))

(use-package eglot-booster
	:after eglot
	:config	(eglot-booster-mode))


(provide 'languages)
;;; languages.el ends here
