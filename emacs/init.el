;;; init.el --- init file                            -*- lexical-binding: t; -*-

;; Author: me :3

;;; Commentary:
;;; Code:

(setq debug-on-error nil)
(setq evil-want-keybinding nil)
(require 'package)
   (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;    (add-to-list 'package-archives
;;    '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
   (require 'package)
   (add-to-list 'package-archives
		'("Melpa" . "https://melpa.org/packages/") t)
;;; Code:

(load "~/.emacs.d/load-packages.el")
(load-file "~/.emacs.d/evil-config.el")
(load-file "~/.emacs.d/bindings.el")
(load-file "~/.emacs.d/exwm-config.el")
(load-file "~/.emacs.d/custom-functions.el")
(load-file "~/.emacs.d/irc.el")
(load-file "~/.emacs.d/abbrevs.el")

(load-theme 'monokai-pro-spectrum t)
(load-theme 'flatland t)
(require 'rainbow-delimiters)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :family "mononoki" :height 120))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "magenta" :inherit rainbow-delimiters-base-face)))))

;; Appearence
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(require 'vertico)
(vertico-mode 1)
(which-key-mode)
(global-visual-line-mode)
(display-battery-mode 1)
(display-time-mode 1)


(use-package ibuffer-projectile
  :ensure t
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-projectile-set-filter-groups)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))
(setq kill-buffer-query-functions nil)
;; git
(setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
(evil-define-key 'normal global-map (kbd "SPC g") 'magit-status)

;; flycheck
(require 'flycheck)

;; recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(setq web-mode-code-indent-offset 2)

;; C
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))

;; haskell

;; (add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))
;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;; (add-hook 'haskell-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-backends)
;;                  (append '((company-capf company-dabbrev-code))
;;                          company-backends))))
;; (with-eval-after-load 'flycheck
;;   (flycheck-add-next-checker 'haskell-ghc 'haskell-hlint)
;;   (flycheck-add-mode 'haskell-stack-ghc 'haskell-mode)
;;   (flycheck-add-mode 'haskell-ghc 'haskell-mode))

;; ;; Company
;; (add-hook 'after-init-hook 'global-company-mode)

;; Ivy
(require 'counsel)

;; org-mode
(add-hook 'org-mode-hook (lambda () (corfu-mode -1)))


;; auto-save
(setq auto-save-default nil)

;; 
(use-package helpful
  :ensure t
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))

;;  mac
(if (eq system-type 'darwin)
    (lambda()
    (setq mac-command-modifier 'none)
    (setq mac-option-modifier) 'meta))

;; vterm
(setq vterm-max-scrollback 100000)
(defun open-new-vterm ()
  "Open a new instance of vterm."
  (interactive)
  (vterm (generate-new-buffer-name "*vterm*")))

;; tabs/spaces
(setq make-backup-files nil)
;;misc
(setq undo-tree-auto-save-history nil)

;; custom set vars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("89c50e934a32921ed51da9fa883484a433f32fbc5cf9780860d13322e23edcde"
     "ebbd4bbb0f017cb09f7a3b1363b83dfde0c5f4970cda2705419457366cd2de91"
     "468c69d9ee35f90c5686f14786516071f3fb1848c60bad1caa40bc5dcda811dc"
     "b6269b0356ed8d9ed55b0dcea10b4e13227b89fd2af4452eee19ac88297b0f99"
     "c8b83e7692e77f3e2e46c08177b673da6e41b307805cd1982da9e2ea2e90e6d7"
     "9cda05ef581a03ce47f9e490c241f659520be02a7318757048db32fef4421da9"
     "38c4fb6c8b2625f6307f3dde763d5c61d774d854ecee9c5eb9c5433350bc0bef"
     "a1c18db2838b593fba371cb2623abd8f7644a7811ac53c6530eebdf8b9a25a8d"
     "c71fd8fbda070ff5462e052d8be87423e50d0f437fbc359a5c732f4a4c535c43"
     "e3a1b1fb50e3908e80514de38acbac74be2eb2777fc896e44b54ce44308e5330"
     "b02eae4d22362a941751f690032ea30c7c78d8ca8a1212fdae9eecad28a3587f"
     "16198c5c7319d07ded977d2414a96fff95f468af313cff6f684fd02f9dfff9b2"
     "5b9b69f13f7eca5e83a32ea154fb0b3459028cec1798df982f32f899df6c4faa"
     "e5494adf200eeff1505839672150dde6053e086869189c381b1ce9b792dda3a8"
     "37c8c2817010e59734fe1f9302a7e6a2b5e8cc648cf6a6cc8b85f3bf17fececf"
     "bc7d4cfb6d4bd7074a39f97f0b8a057c5b651c403950bbbc4ad35a609ad6268a"
     "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde"
     "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077"
     "42abd324628cb258bb8bbb1fc8ebcd4920f6681f616eb1ac80c6f8853258c595"
     "21055a064d6d673f666baaed35a69519841134829982cbbb76960575f43424db"
     "3325e2c49c8cc81a8cc94b0d57f1975e6562858db5de840b03338529c64f58d1"
     "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36"
     "f681100b27d783fefc3b62f44f84eb7fa0ce73ec183ebea5903df506eb314077"
     "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7"
     "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d"
     "78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27"
     "fb83a50c80de36f23aea5919e50e1bccd565ca5bb646af95729dc8c5f926cbf3"
     default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(beacon buffer-move ccls company corfu-terminal counsel-projectile
	    evil-collection evil-easymotion evil-lion evil-snipe
	    exwm-modeline flycheck-haskell free-keys general helm
	    helpful ibuffer-projectile json-reformat lua-mode magit
	    monokai-pro-theme org-gcal php-mode rainbow-delimiters
	    rust-mode telephone-line typescript-mode undo-tree vertico
	    vterm web-mode yasnippet)))

;;; init.el ends here
