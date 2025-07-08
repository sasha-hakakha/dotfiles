;;; delimiters.el --- evil bindings related to delimiters  -*- lexical-binding: t; -*-


;; Author:  me!
;; Keywords:


;;; Commentary:

;; 

;;; Code:

(defun my-hello-world ()
  "Print 'Hello, world!' in the minibuffer."
  (interactive)
  (let ((line-text (thing-at-point 'line t))
	(index (current-column)))
        (message "Line: %S | Cursor column: %d" line-text index))

  )
  ;; (setq my-saved-line-text (thing-at-point 'line t))
  ;; (setq my-saved-cursor-col (current-column))
  ;; (message "Saved line: %S | column: %d" my-saved-line-text my-saved-cursor-col)
  ;; (message "Hello, world!"))



(provide 'delimiters)
;;; delimiters.el ends here
