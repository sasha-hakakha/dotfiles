;; evil-config.el

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-collection-init))

(evil-define-key 'normal global-map (kbd "t") 'evil-substitute)

(evil-define-key 'normal 'global
  (kbd "Y")
  (lambda ()
    (interactive)
    (evil-yank (point) (line-end-position))))

(use-package evil-snipe
	     :after evil
	     :config
	     (evil-snipe-mode 1)
	     (evil-snipe-override-mode 1))

(use-package evil-easymotion
  :after evil
  :config
  (evilem-default-keybindings "SPC"))

(use-package evil-lion
  :after evil
  :config
  (evil-lion-mode 1))

(evilem-default-keybindings "SPC")

(provide 'evil-config)
;;; evil-config.el ends here
