;;; abbrevs.el --- abbreviations to be used with abbrev/dabbrev  -*- lexical-binding: t; -*-

;;; Commentary:
;; Author:  Sasha Hakakha


;;; Code:
(setq-default abbrev-mode t)
 
(define-abbrev global-abbrev-table "nmaphtb" "nmap -sC -sV -oN nmap ")

(provide 'abbrevs)
;;; abbrevs.el ends here
