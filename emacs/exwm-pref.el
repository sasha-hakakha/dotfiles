
;; stuff for exwm
(require 'exwm)
(require 'exwm-randr)

(load-file "~/.emacs.d/custom-functions.el")

(setq exwm-workspace-show-all-buffers t)
(setq exwm-randr-workspace-monitor-plist '(0 "eDP" 1 "HDMI-A-0"))
(setq exwm-layout-show-all-buffers t)
(setq exwm-workspace-number 2)

(require 'exwm-modeline)
(setq exwm-modeline-randr t)
(setq exwm-modeline-short nil)
(setq exwm-modeline-urgent t)
(add-hook 'exwm-init-hook 'exwm-modeline-mode)
(add-hook 'exwm-randr-screen-change-hook
           (lambda ()
             (let ((connected (shell-command-to-string "xrandr")))
               (if (and (string-match "HDMI-0 connected" connected) (string-match "DP-0 connected" connected) (string-match "DVI-I-1 connected" connected))
                   (start-process-shell-command
                    "xrandr" nil "xrandr --output HDMI-0 --rotate right --pos 0x240 --output DP-0 --auto --pos 1080x0 --output DVI-I-1 --auto --pos 1080x1080")
                 ;;else
                 (start-process-shell-command
                  "xrandr" nil "xrandr --output DP-0 --auto --primary --output HDMI-0 --auto")))
             (exwm-randr-refresh)))
;; (require exwm-firefox-evil)
;; (require 'exwm-firefox)
;; (exwm-firefox-mode)
(exwm-randr-mode)
(setq persp-auto-resume-time 0)

(setq exwm-title-length 70)

(defun b3n-exwm-set-buffer-name ()
  (if (and exwm-title (string-match "\\`http[^ ]+" exwm-title))
      (let ((url (match-string 0 exwm-title)))
        (setq-local buffer-file-name url)
        (setq-local exwm-title (replace-regexp-in-string
                                (concat (regexp-quote url) " - ")
                                ""
                                exwm-title))))

  (setq-local exwm-title
              (concat
               exwm-class-name
               "<"
               ;; (if (<= (length exwm-title) exwm-title-length)
               exwm-title
                 ;; (concat (substring exwm-title 0 exwm-title-length) "…"))
               ">"))

  (exwm-workspace-rename-buffer exwm-title))

(add-hook 'exwm-update-class-hook 'b3n-exwm-set-buffer-name)
(add-hook 'exwm-update-title-hook 'b3n-exwm-set-buffer-name)

(defun exwm-assign-workspace (index)
  "switch to workspace without changing monitor"
  (interactive "p")
  (let* ((current-index exwm-workspace-current-index)
         (current-monitor (plist-get exwm-randr-workspace-monitor-plist current-index))
         (displaced-monitor (plist-get exwm-randr-workspace-monitor-plist index)))
    ;; if not associated, copy current association
    (unless displaced-monitor
      (setq displaced-monitor current-monitor))
    ;; (message "%s, %s" current-monitor displaced-monitor)
    ;; swapping prevents a monitor losing all of its associations
    (plist-put exwm-randr-workspace-monitor-plist current-index displaced-monitor)
    (plist-put exwm-randr-workspace-monitor-plist index current-monitor)

    (exwm-workspace-switch-create index)

    (exwm-randr-refresh)
    ;; (message "%s, %s, %s" exwm-randr-workspace-monitor-plist current-index index)
    ))

(defun exwm-other-assigned-workspace ()
  "focus other monitor's workspace. Assumes 2 monitors"
  (interactive)
  ;; super hacky, assumes that there are only two active workspaces
  (exwm-workspace-switch-create (exwm-workspace--workspace-from-frame-or-index
                                 (let* ((workspace-list (seq-filter 'exwm-workspace--active-p exwm-workspace--list))
                                       (active-workspaces workspace-list))
                                   (while (not (eq (car active-workspaces) (selected-frame)))
                                     (setq active-workspaces (cdr active-workspaces)))
                                   (setq active-workspaces (cdr active-workspaces))
                                   (if (eq active-workspaces nil)
                                       (car workspace-list)
                                     (car active-workspaces))))))


;; All buffers created in EXWM mode are named "*EXWM*". You may want to
;; change it in `exwm-update-class-hook' and `exwm-update-title-hook', which
;; are run when a new X window class name or title is available.  Here's
;; some advice on this topic:
;; + Always use `exwm-workspace-rename-buffer` to avoid naming conflict.
;; + For applications with multiple windows (e.g. GIMP), the class names of
                                        ;    all windows are probably the same.  Using window titles for them makes
;;   more sense.
;; In the following example, we use class names for all windows except for
;; Java applications and GIMP.
(add-hook 'exwm-update-class-hook
          (lambda ()
            (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-class-name))))
(add-hook 'exwm-update-title-hook
          (lambda ()
            (when (or (not exwm-instance-name)
                      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                      (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-title))))


;; store the buffer we were at before a jump
(setq exwm-marked-buffer "*scratch*")

;; Global keybindings can be defined with `exwm-input-global-keys'.
;; Here are a few examples:
(setq exwm-input-global-keys
      `(
	;; buffer movement and creation
	([?\M-J] . evil-window-split-and-switch)
	([?\M-K] . evil-window-split-and-switch)
	([?\M-H] . evil-window-vsplit-and-switch)
	([?\M-L] . evil-window-vsplit-and-switch)

	([?\M-h] . evil-window-left)
	([?\M-j] . evil-window-down)
	([?\M-k] . evil-window-up)
	([?\M-l] . evil-window-right)

	([M-left] . buf-move-left)
	([M-right] . buf-move-right)
	([M-up] . buf-move-up)
	([M-down] . buf-move-down)

        ;; Bind "s-r" to exit char-mode and fullscreen mode.
        ([?\s-r] . exwm-reset)
        ;; Bind "s-w" to window switcher
        ([?\s-w] . consult-buffer)
        ([?\M-W] . consult-buffer)

        ;;quicker 2-split swtiching
        ([?\s-o] . (lambda ()
                     (interactive)
                     (other-window 1)))
        ([?\M-o] . (lambda ()
                     (interactive)
                     (other-window 1)))

        ;;fast workspace switch
        ([?\s-O] . exwm-other-assigned-workspace)
        ([?\M-O] . exwm-other-assigned-workspace)

        ;;quick calc switching
        ;; ([?\s-c] . switch-to-calc)

        ;;mark the buffer
        ([?\s- ] . (lambda ()
                     (interactive)
                     (setq exwm-marked-buffer (current-buffer))
                     (message "Marked the current buffer, return (across workspaces) with s-x")))

        ;;return to marked buffer
        ([?\s-x] . (lambda ()
                     (interactive)
                     (let ((hold exwm-marked-buffer))
                       (setq exwm-marked-buffer (current-buffer))
                       (exwm-workspace-switch-to-buffer hold))))

        ;; Bind "s-0" to "s-9" to switch to a layout.
        ,@(mapcar
           (lambda (digit)
             ;; `(,(kbd (concat "s-" (int-to-string digit))) . (lambda () (interactive) (exwm-assign-workspace ,digit)))
             `(,(kbd (concat "s-" (int-to-string digit))) . (lambda ()
                                                              (interactive)
                                                              (exwm-workspace-switch-create ,digit)))
             )
           (number-sequence 0 9))

        ;; Bind "s-d" to launch applications ('M-&' also works if the output
        ;; buffer does not bother you).
        ([?\s-d] . (lambda (command)
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command command nil command)))
        ;; browser
        ([?\s-e] . (lambda ()
                     (interactive)
                     (start-process-shell-command "firefox" nil "firefox")))

        ;;terminal
        ([s-return] . (lambda ()
                        (interactive)
                        ;;if we are already there, switch back
                        (if (string= (buffer-name (current-buffer)) "*vterm*")
                            (exwm-workspace-switch-to-buffer exwm-last-buffer)
                          (progn
                            (setq exwm-last-buffer (current-buffer))
                            (vterm)))))

        ;; return to the last window
        ([s-tab] . (lambda ()
                     (interactive)
                     (exwm-workspace-switch-to-buffer (other-buffer))))

        ;; kill the current window and close the buffer if possible
        ([?\s-Q] . kill-buffer-and-window)

        ;; kill current buffer but leave window
        ([?\s-q] . (lambda () (interactive) (kill-buffer nil)))

        ;; suspend
        ([?\s-`] . (lambda ()
                     (interactive)
                     (start-process "" nil "systemctl" "suspend")))

        ;; audio keys
        ([?\s-m] . (lambda ()
                     (interactive)
                     (start-process "" nil "pactl" "set-sink-mute" "@DEFAULT_SINK@" "toggle")))
        ([?\s-\-] . (lambda ()
                      (interactive)
                      (start-process "" nil "pactl" "set-sink-volume" "@DEFAULT_SINK@" "-5%")))
        ([?\s-=] . (lambda ()
                     (interactive)
                     (start-process "" nil "pactl" "set-sink-volume" "@DEFAULT_SINK@" "+5%")))

        ;; brightness keys
        ([?\s-\[] . (lambda ()
                      (interactive)
                      (start-process "" nil "brightnessctl" "s" "5%-")))
        ([?\s-\]] . (lambda ()
                      (interactive)
                      (start-process "" nil "brightnessctl" "s" "+5%")))

        ))
;; To add a key binding only available in line-mode, simply define it in
;; `exwm-mode-map'.  The following example shortens 'C-c q' to 'C-q'.

;; The following example demonstrates how to use simulation keys to mimic
;; the behavior of Emacs.  The value of `exwm-input-simulation-keys` is a
;; list of cons cells (SRC . DEST), where SRC is the key sequence you press
;; and DEST is what EXWM actually sends to application.  Note that both SRC
;; and DEST should be key sequences (vector or string).
;; (setq exwm-input-simulation-keys
;;       '(
;;         ;; movement
;;         ([?\C-b] . [left])
;;         ([?\M-b] . [C-left])
;;         ([?\C-f] . [right])
;;         ([?\M-f] . [C-right])
;;         ([?\C-p] . [up])
;;         ([?\C-n] . [down])
;;         ([?\C-a] . [home])
;;         ([?\C-e] . [end])
;;         ([?\M-v] . [prior])
;;         ([?\C-v] . [next])
;;         ([?\C-d] . [delete])
;;         ([?\C-k] . [S-end delete])
;;         ;; cut/paste.
;;         ;; ([?\C-w] . [?\C-x])
;;         ;; ([?\M-w] . [?\C-c])
;;         ;; ([?\C-y] . [?\C-v])
;;         ;; search
;;         ([?\C-s] . [?\C-f])))

;; You can hide the minibuffer and echo area when they're not used, by
;; uncommenting the following line.
;; (setq exwm-workspace-minibuffer-position 'bottom)

;; Do not forget to enable EXWM. It will start by itself when things are
;; ready.  You can put it _anywhere_ in your configuration.
(exwm-enable)

