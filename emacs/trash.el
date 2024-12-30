;; garbage pile. this file is not called
(defmacro json-print (key value)
  "Macro to print a JSON key-value pair."
  `(print (json-encode `((,key . ,value)))))
(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
(evil-define-key 'normal global-map (kbd "SPC S") 'reload-init-file)

   (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

   ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
   ;; and `package-pinned-packages`. Most users will not need or want to do this.
   ;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;   (package-initialize)

;; (unless (package-installed-p 'quelpa)
;;   (with-temp-buffer
;;     (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
;;     (eval-buffer)
;;     (quelpa-self-upgrade)))
;; (require 'quelpa)

;; (unless (package-installed-p 'quelpa-use-package)
;;   (quelpa
;;    '(quelpa-use-package
;;      :fetcher git
;;      :url "https://framagit.org/steckerhalter/quelpa-use-package.git")))
;; (require 'quelpa-use-package)
  ;; (package-initialize)

;; exwm
;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-example)


;; ;; org
;; ;; defines google-client-id google-client-secret google-calendar-id 
;; (load-file "~/dotfiles/keys.el")
;; (require 'plstore)
;; (add-to-list 'plstore-encrypt-to '(gpg-key-id))
;; (load-file "~/dotfiles/google_auth.el")
;; (require 'org-gcal)
;; (setq org-gcal-client-id google-client-id
;;       org-gcal-client-secret google-client-secret
;;       org-gcal-file-alist '(("sasha.hakakha@dat.com" . "~/.emacs.d/gcal.org")))

;; buffers
;;(use-package ibuffer
;;  :ensure t
;;  :bind ("C-x C-b" . ibuffer))

;; typing behavior (?)
;; (use-package smartparens
;;   :ensure t
;;   :config
;;   (require 'smartparens-config)
;;   (smartparens-global-mode t)
;;   (show-smartparens-global-mode t))

;;(require 'lsp-eslint)

;;(add-to-list 'eglot-server-programs '(web-mode  eglot-eslint "eslint" "--stdin" "--stdin-filename" "%s"))
;; (add-to-list 'eglot-server-programs '(rust-mode . ("~/.local/bin/rust-analyzer")))
;; (add-hook 'web-mode 'eglot-ensure)

;; (require 'corfu)
;; (use-package corfu
;;   ;; Optional customizations
;;   :custom
;;   (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
;;   (corfu-auto t)                 ;; Enable auto completion
;;   ;; (corfu-separator ?\s)          ;; Orderless field separator
;;   ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
;;   ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
;;   ;; (corfu-preview-current nil)    ;; Disable current candidate preview
;;   ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
;;   ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
;;   ;; (corfu-scroll-margin 5)        ;; Use scroll margin
;;   ;; Enable Corfu only for certain modes.
;;   ;; :hook ((prog-mode . corfu-mode)
;;   ;;        (shell-mode . corfu-mode)
;;   ;;        (eshell-mode . corfu-mode))

;;   ;; Recommended: Enable Corfu globally.
;;   ;; This is recommended since Dabbrev can be used globally (M-/).
;;   ;; See also `global-corfu-modes'.
;;   :init
;;   (global-corfu-mode))
