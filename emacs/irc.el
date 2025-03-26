;;; irc.el --- manages irc stuff with erc (for now)  -*- lexical-binding: t; -*-

;;; Commentary:

;; a binding to log into libera and join favorite rooms, etc

;; Author:  Sasha Hakakha

;;; Code:
(setq erc-modules '(services autojoin button completion fill irccontrols list match menu
                             move-to-prompt netsplit networks readonly ring stamp track)
      erc-nick "k0zy"
      erc-use-auth-source-for-nickserv-password t
      erc-autojoin-channels-alist '(("libera.chat"
                                     "#emacs"
				     "#linux"
				     "#archlinux"
				     "#haskell"
				     "#security"))

      erc-hide-list '("JOIN" "PART" "QUIT")
      erc-current-nick-highlight-type 'nick
      erc-keywords nil
      erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE")
      erc-track-use-faces t
      erc-track-faces-priority-list '(erc-current-nick-face erc-keyword-face)
      erc-track-priority-faces-only 'all)

(defun start-libera-erc ()
  "Start erc and autojoin various channels"
  (interactive)
  (erc :server "irc.libera.chat" :port 6667))

(provide 'irc)
;;; irc.el ends here
