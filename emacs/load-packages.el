;;; Code:
(straight-use-package 'use-package)
(require 'use-package)

(setq straight-use-package-by-default t)


;; NOT LAZY
(use-package quelpa
  :ensure t)

(use-package quelpa-use-package
  :after quelpa
  :ensure t)

(use-package dotenv
  :straight (dotenv
             :type git
             :host github
             :repo "pkulev/dotenv.el"))


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

(use-package eglot-booster
  :straight (eglot-booster
             :type git
             :host github
             :repo "jdtsmith/eglot-booster")
  :after eglot
  :config
  (eglot-booster-mode))

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

;; PROJECT MANAGEMENT
(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)))

;; TODO should this be moved to bindings file?
(define-prefix-command 'project-management-map)
(global-set-key (kbd "C-p") 'project-management-map)

(use-package consult
  :ensure t)

;; org!!
(use-package org
  :ensure t
  :hook
  (org-mode . my/org-evil-window-bindings)
  :config
  ;; Define a function to set the keys locally in org-mode buffers
  (defun my/org-evil-window-bindings ()
    (evil-define-key 'normal org-mode-map
      (kbd "M-h") 'evil-window-left
      (kbd "M-j") 'evil-window-down
      (kbd "M-k") 'evil-window-up
      (kbd "M-l") 'evil-window-right)))

(use-package evil-escape
  :ensure t
  :after evil
  :init
  (setq evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode 1))

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
(use-package cmake-mode
 :ensure t
 :defer t)

;; (use-package chatgpt :ensure t)

;; (use-package dotenv
;;   :ensure t
;;   :config
;;   (dotenv-update-env-from-file "~/.emacs.d/.env"))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :init (global-company-mode))

;; (when (file-exists-p "~/.emacs.d/.env.el")
;;   (load "~/.emacs.d/.env.el")
;;     (use-package smudge
;;     :bind-keymap ("C-c ." . smudge-command-map)
;;     :custom
;;     (smudge-oauth2-client-secret "...")
;;     (smudge-oauth2-client-id "...")
;;     ;; optional: enable transient map for frequent commands
;;     (smudge-player-use-transient-map t)
;;     :config
;;     ;; optional: display current song in mode line
;;     (global-smudge-remote-mode)))

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
  
;; (use-package helm
;;   :ensure t
;;   :defer t
;;   :commands helm-M-x)

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
   :ensure t)

(use-package counsel
  :ensure t
  :after ivy
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

;; (use-package org-gcal
;;   :ensure t
;;   :defer t)

(use-package editorconfig
  :ensure t
  :config (editorconfig-mode 1))

(use-package lua-mode
  :ensure t
  :defer t)
