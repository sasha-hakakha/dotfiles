;;; languages.el --- configure programming languages and language servers  -*- lexical-binding: t; -*-

;; Author:  me!
;; Keywords: languages
;;; Commentary:

;;; Code:
(use-package quelpa
  :ensure t)

(use-package quelpa-use-package
  :ensure t
  :after quelpa)

(use-package eglot
  :ensure t
  :commands eglot
  :config
  (setq eglot-server-programs
        '((rust-mode . ("rust-analyzer"))
          (haskell-mode . ("haskell-language-server-wrapper" "--lsp"))
          ((typescript-mode tsx-ts-mode) . ("typescript-language-server" "--stdio"))
          ((js-mode js2-mode javascript-mode) . ("typescript-language-server" "--stdio"))
          (python-mode . ("pylsp"))))
  (add-hook 'typescript-mode-hook #'eglot-ensure)
  (add-hook 'tsx-ts-mode-hook #'eglot-ensure))

;; C/C++
(use-package clang-format
  :ensure t)

(with-eval-after-load 'eglot
  (yas-global-mode 1)
  (add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(c++-mode . ("clangd"))))

(defun my-c-cpp-mode-setup ()
  (when (executable-find "clangd")
    (eglot-ensure))
  (company-mode 1)
  (flycheck-mode 1)
  (when (locate-dominating-file default-directory ".clang-format")
    (add-hook 'before-save-hook #'clang-format-buffer nil t))
   (setq c-basic-offset 4       ; indent 4 spaces
        tab-width 4
        indent-tabs-mode nil))

(use-package cc-mode
  :ensure nil
  :hook ((c-mode . my-c-cpp-mode-setup)
         (c++-mode . my-c-cpp-mode-setup)))

;; yaml/yml
(use-package yaml-mode
  :ensure t
  :mode ("\\.ya?ml\\'" . yaml-mode)
  :defer t)

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

;; typescript
(use-package yasnippet
  :ensure t
  :defer nil) ;; load immediately

;; (use-package js-doc
;;   :ensure t
;;   :after yasnippet
;;   :config
;;   (require 'cl-lib))

(use-package prettier
  :ensure t
  :after typescript-mode)

(use-package typescript-mode
  :ensure t
  :defer t
  :hook
  ((typescript-mode . (lambda ()
                        (prettier-mode 1)
                        (eglot-ensure)
                        (evil-define-key 'normal typescript-mode-map
                          (kbd "SPC l f") #'prettier-prettify
                          (kbd "SPC l c") #'js-doc-insert-function-doc)))))

(defun my-typescript-indent-setup ()
  (setq-local typescript-indent-level 2)
  (setq-local tab-width 2)
  (setq-local indent-tabs-mode nil))
(add-hook 'typescript-mode-hook #'my-typescript-indent-setup)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :hook ((python-mode . eglot-ensure)
         (python-mode . company-mode)
         (python-mode . flycheck-mode)
         (js2-mode . (lambda ()
                       (prettier-mode 1))))
  :config
  (setq js2-basic-offset 2))

(use-package eglot-booster
  :after eglot
  :quelpa (eglot-booster :fetcher github :repo "jdtsmith/eglot-booster")
  :config
  (eglot-booster-mode 1))

;; common lisp (SLIME)
(use-package slime
  :ensure t
  :mode ("\\.lisp\\'" . lisp-mode)
  :init
  (setq inferior-lisp-program "sbcl")
  :config
  (setq slime-contribs '(slime-fancy slime-company)))

(use-package slime-company
  :ensure t
  :after (slime company)
  :config
  (setq slime-company-completion 'fuzzy))

(provide 'languages)
;;; languages.el ends here
