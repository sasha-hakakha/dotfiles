;;; evil-config.el --- Evil mode configuration -*- lexical-binding: t; -*-

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)

  ;; Normal-mode keybindings
  (evil-define-key 'normal global-map (kbd "t") #'evil-substitute)
  (evil-define-key 'normal global-map (kbd "Y")
    (lambda ()
      (interactive)
      (evil-yank (point) (line-end-position)))))

;; Make sure evil-collection loads after evil
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Snipe
(use-package evil-snipe
  :after evil
  :config
  (evil-snipe-mode 1)
  (evil-snipe-override-mode 1))

;; Easymotion
(use-package evil-easymotion
  :after evil
  :config
  (evilem-default-keybindings "SPC"))

;; Lion alignment
(use-package evil-lion
  :after evil
  :config
  (evil-lion-mode 1))

(with-eval-after-load 'evil
  ;; Around function
  (evil-define-text-object evil-a-defun (count &optional beg end type)
    "Select a whole defun."
    (evil-select-an-object 'evil-defun beg end type count))

  ;; Inner function
  (evil-define-text-object evil-inner-defun (count &optional beg end type)
    "Select inner defun."
    (evil-select-inner-object 'evil-defun beg end type count))

  ;; Bind them
  (define-key evil-outer-text-objects-map "f" #'evil-a-defun)
  (define-key evil-inner-text-objects-map "f" #'evil-inner-defun))

(provide 'evil-config)
;;; evil-config.el ends here
