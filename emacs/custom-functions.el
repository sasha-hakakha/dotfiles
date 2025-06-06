;;; custom-functions.el --- User defined functions

;;; Commentary:
;; I love Emacs more than I have loved any person I have ever met

;;; Code:

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

(defun window-split-and-switch ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun window-vsplit-and-switch ()
  (interactive)
  (split-window-right)
  (other-window 1))

(defun equalize-buffer-sizes ()
  "Makes all open buffers the same size."
  (interactive)
  (let ((buffers (buffer-list))
        (num-buffers (count-windows)))
    (delete-other-windows)
    (dotimes (i num-buffers)
      (split-window-horizontally))
    (balance-windows)))

(defun kill-all-vterm-buffers ()
  "Kill all vterm buffers."
  (interactive)
  (dolist (buf (buffer-list))
    (when (eq 'vterm-mode (buffer-local-value 'major-mode buf))
      (kill-buffer buf))))

(defun open-new-vterm ()
  "Open a new instance of vterm."
  (interactive)
  (vterm (generate-new-buffer-name "*vterm*")))

(provide 'custom-functions)

;;; custom-functions.el ends here
