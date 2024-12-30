;; movement
(defun evil-window-split-and-switch ()
  "Split the window vertically and switch to the new buffer."
  (interactive)
  (evil-window-split)
  (other-window 1))

(defun evil-window-vsplit-and-switch ()
  "Split the window horizontally and switch to the new buffer."
  (interactive)
  (evil-window-vsplit)
  (other-window 1))



;; Define functions for non-Evil key bindings
(defun window-split-and-switch ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun window-vsplit-and-switch ()
  (interactive)
  (split-window-right)
  (other-window 1))

;; Non-Evil keybinding

(defun equalize-buffer-sizes ()
  "Makes all open buffers the same size."
  (interactive)
  (let ((buffers (buffer-list))
        (num-buffers (count-windows)))
    (delete-other-windows)
    (dotimes (i num-buffers)
      (split-window-horizontally))
    (balance-windows)))

(evil-define-key 'normal global-map (kbd "SPC SPC e") 'equalize-buffer-sizes)

(defun kill-all-vterm-buffers ()
  "Kill all vterm buffers."
  (interactive)
  (dolist (buf (buffer-list))
    (when (eq 'vterm-mode (buffer-local-value 'major-mode buf))
      (kill-buffer buf))))

(evil-define-key 'normal global-map (kbd "SPC p") 'kill-all-vterm-buffers)
(global-set-key (kbd "C-c k") 'kill-all-vterm-buffers)


;;; ; eVIl bindings
(evil-define-key 'normal global-map (kbd "C-u") 'evil-scroll-up)
(evil-define-key 'normal global-map (kbd "SPC d") 'ido-dired)
(evil-define-key 'normal global-map (kbd "SPC i") 'ibuffer)
(evil-define-key 'normal global-map (kbd "SPC RET") 'open-new-vterm)
(evil-define-key 'normal global-map (kbd "SPC DEL") 'abort-recursive-edit)


(evil-define-key 'normal global-map (kbd "M-J") 'evil-window-split-and-switch)
(evil-define-key 'normal global-map (kbd "M-K") 'evil-window-split-and-switch)
(evil-define-key 'normal global-map (kbd "M-H") 'evil-window-vsplit-and-switch)
(evil-define-key 'normal global-map (kbd "M-L") 'evil-window-vsplit-and-switch)

(evil-define-key 'normal global-map (kbd "M-h") 'evil-window-left)
(evil-define-key 'normal global-map (kbd "M-j") 'evil-window-down)
(evil-define-key 'normal global-map (kbd "M-k") 'evil-window-up)
(evil-define-key 'normal global-map (kbd "M-l") 'evil-window-right)


(evil-define-key 'normal global-map (kbd "s-l") (lambda () (interactive) (enlarge-window-horizontally 2)))
(evil-define-key 'normal global-map (kbd "s-h") (lambda () (interactive) (shrink-window-horizontally 2)))
(evil-define-key 'normal global-map (kbd "s-j") (lambda () (interactive) (enlarge-window 2)))
(evil-define-key 'normal global-map (kbd "s-k") (lambda () (interactive) (shrink-window 2)))

(evil-define-key 'normal global-map (kbd "SPC s ") 'save-buffer)
(evil-define-key 'normal global-map (kbd "SPC q") 'delete-window)
(evil-define-key 'normal global-map (kbd "SPC Q") 'kill-buffer)
(evil-define-key 'normal global-map (kbd "SPC B") 'balance-windows)
(evil-define-key 'normal global-map (kbd "SPC o") 'delete-other-windows)

(evil-define-key 'normal global-map (kbd "SPC r ")  'counsel-projectile-rg)
(evil-define-key 'normal global-map (kbd "SPC f")  'counsel-projectile-find-file)
(evil-define-key 'normal global-map (kbd "SPC \;") 'helm-mini)
(evil-define-key 'normal global-map (kbd "SPC l") 'display-line-numbers-mode)

(evil-define-key 'normal global-map (kbd "SPC h c") 'helpful-callable)
(evil-define-key 'normal global-map (kbd "SPC h v") 'helpful-variable)
(evil-define-key 'normal global-map (kbd "SPC h k") 'helpful-key)
(evil-define-key 'normal global-map (kbd "SPC h w") 'where-is)

(with-eval-after-load 'tide
  (evil-define-key 'normal global-map (kbd "SPC m R") 'tide-restart-server)
  (evil-define-key 'normal global-map (kbd "SPC m r s") 'tide-rename-symbol)
  (evil-define-key 'normal global-map (kbd "SPC m r f") 'tide-rename-file)
  (evil-define-key 'normal global-map (kbd "SPC m f") 'tide-format))

(evil-define-key 'normal global-map (kbd "SPC c p")  'counsel-projectile-switch-project)

(evil-define-key 'normal global-map (kbd "SPC R")  'open-repos)

(evil-define-key 'normal global-map (kbd "SPC F")  'toggle-frame-fullscreen)

(evil-define-key 'normal global-map (kbd "SPC B")  'big-file)

;; non-evil bindings
(global-set-key (kbd "M-x") 'counsel-M-x)

(global-set-key (kbd "C-c r") 'counsel-projectile-rg)
(global-set-key (kbd "C-c f") 'counsel-projectile-find-file)
(global-set-key (kbd "C-c p") 'counsel-projectile-switch-project)
(global-set-key (kbd "C-c R") 'open-repos)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c F") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c \;") 'helm-mini)
(global-set-key (kbd "C-c i") 'ibuffer)
(global-set-key (kbd "C-c q") 'kill-buffer)

(global-set-key (kbd "M-J") 'window-split-and-switch)
(global-set-key (kbd "M-K") 'window-split-and-switch)
(global-set-key (kbd "M-H") 'window-vsplit-and-switch)
(global-set-key (kbd "M-L") 'window-vsplit-and-switch)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-w") 'delete-window)
(global-set-key (kbd "M-<left>") 'buf-move-left)
(global-set-key (kbd "M-<right>") 'buf-move-right)
(global-set-key (kbd "M-<up>") 'buf-move-up)
(global-set-key (kbd "M-<down>") 'buf-move-down)



(global-set-key (kbd "M-RET") 'open-new-vterm)

;; exwm
(define-key exwm-mode-map (kbd "C-SPC") 'exwm-input-send-next-key)
(provide 'bindings)
