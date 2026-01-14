;;; Code:

(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(unless package--initialized
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package general
  :demand t)

(use-package exwm-modeline
  :demand t)

(use-package magit
  :demand t)

(use-package evil
  :demand t
  :init
  (setq evil-want-integration t)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :demand t
  :config
  (evil-collection-init))

(use-package monokai-pro-theme
  :demand t)

(use-package beacon
  :demand t
  :after (projectile flycheck evil)
  :init
  (beacon-mode 1))

(use-package telephone-line
  :demand t
  :after (projectile flycheck evil nyan-mode winum meow)
  :init
  (telephone-line-mode 1))

(use-package vertico
  :init
  (vertico-mode))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
  :config
  (setq completion-styles '(orderless basic)))

(define-prefix-command 'project-management-map)
(global-set-key (kbd "C-p") 'project-management-map)

(use-package consult)

(use-package org
  :hook
  (org-mode . my/org-evil-window-bindings)
  :config
  (defun my/org-evil-window-bindings ()
    (evil-define-key 'normal org-mode-map
      (kbd "M-h") 'evil-window-left
      (kbd "M-j") 'evil-window-down
      (kbd "M-k") 'evil-window-up
      (kbd "M-l") 'evil-window-right)))

(use-package evil-escape
  :after evil
  :init
  (setq evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode 1))

(use-package evil-snipe
  :after evil)

(use-package evil-easymotion
  :after evil)

(use-package buffer-move
  :demand t)

(use-package dabbrev
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` "))

(use-package cmake-mode
  :defer t)

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package company
  :init
  (global-company-mode))

(use-package haskell-mode
  :defer t)

(use-package flycheck-haskell
  :defer t)

(use-package racket-mode
  :defer t)

(use-package php-mode
  :defer t)

(use-package ccls
  :commands ccls-initialize)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package yasnippet
  :commands yas-global-mode
  :config
  (yas-global-mode 1))

(use-package ivy)

(use-package counsel
  :after ivy
  :config
  (counsel-mode 1))

(use-package which-key
  :init
  (which-key-mode))

(use-package web-mode
  :mode "\\.html?\\'")

(use-package json-reformat
  :commands json-reformat-region)

(use-package vterm
  :commands vterm)

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package helpful
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))

(use-package undo-tree
  :init
  (global-undo-tree-mode 1))

(use-package evil-lion
  :after evil
  :config
  (evil-lion-mode))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package lua-mode
  :defer t)
