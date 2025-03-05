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

(require 'evil-snipe)
(evil-snipe-mode +1)
(evil-snipe-override-mode +1)
(evilem-default-keybindings "SPC")
(evil-lion-mode +1)

(provide 'evil-config)
;;; evil-config.el ends here
