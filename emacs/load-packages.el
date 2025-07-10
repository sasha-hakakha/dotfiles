(require 'package)

;;; Code:
(eval-when-compile
  ;; Ensure 'use-package' is installed
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package))

;; NOT LAZY
(use-package general
  :ensure t
  :demand t)

(use-package exwm-modeline
  :ensure t
  :demand t)

(use-package magit
  :ensure t
  :demand t)

(use-package evil
  :ensure t
  :demand t
  :init (setq evil-want-integration t)
  :config (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :demand t
  :config
  (evil-collection-init))

(use-package monokai-pro-theme
  :ensure t
  :demand t)

(use-package beacon
  :ensure t
  :demand t
  :init (beacon-mode 1))

(use-package telephone-line
  :ensure t
  :demand t
  :init (telephone-line-mode 1))

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package projectile
  :ensure t
  :init (projectile-mode +1))

(use-package counsel-projectile
  :ensure t
  :after (counsel projectile))

(use-package ibuffer-projectile
  :ensure t
  :after projectile)

(use-package evil-snipe
  :ensure t
  :after evil)

(use-package evil-easymotion
  :ensure t
  :after evil)

(use-package corfu-terminal
  :ensure t
  :init
  (corfu-terminal-mode 1)
  :custom
  (corfu-terminal-disable-on-gui nil))

(use-package buffer-move
  :ensure t
  :demand t)

(use-package dabbrev
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` "))

;; LAZY

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :init (global-company-mode))

(when (file-exists-p "~/.emacs.d/.env.el")
  (load "~/.emacs.d/.env.el")
    (use-package smudge
    :bind-keymap ("C-c ." . smudge-command-map)
    :custom
    (smudge-oauth2-client-secret "...")
    (smudge-oauth2-client-id "...")
    ;; optional: enable transient map for frequent commands
    (smudge-player-use-transient-map t)
    :config
    ;; optional: display current song in mode line
    (global-smudge-remote-mode)))

(use-package haskell-mode
  :ensure t
  :defer t)

(use-package flycheck-haskell
  :ensure t
  :defer t)

(use-package racket-mode
  :ensure t
  :defer t)

(use-package php-mode
  :ensure t
  :defer t)
  
(use-package helm
  :ensure t
  :defer t
  :commands helm-M-x)

(use-package ccls
  :ensure t
  :commands ccls-initialize)

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package yasnippet
  :ensure t
  :commands yas-global-mode
  :config (yas-global-mode 1))

(use-package ivy
  :ensure t
  :init (ivy-mode 1))

(use-package counsel
  :ensure t
  :after ivy
  :bind (("M-x" . counsel-M-x))
  :config (counsel-mode 1))

(use-package which-key
  :ensure t
  :init (which-key-mode))

(use-package web-mode
  :ensure t
  :mode "\\.html?\\'")

(use-package json-reformat
  :ensure t
  :commands json-reformat-region)

(use-package vterm
  :ensure t
  :commands vterm)

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'")

(use-package helpful
  :ensure t
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode 1))

(use-package evil-lion
  :ensure t
  :after evil
  :config (evil-lion-mode))

(use-package org-gcal
  :ensure t
  :defer t)

(use-package editorconfig
  :ensure t
  :config (editorconfig-mode 1))

(use-package lua-mode
  :ensure t
  :defer t)
