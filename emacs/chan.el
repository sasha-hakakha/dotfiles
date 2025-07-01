;;; chan.el --- read 4ch into org                    -*- lexical-binding: t; -*-


;; Author:  me!
;; Keywords: data, multimedia

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(require 'url)
(require 'json)

(defun get-json (board)
  (let ((url-formatted (format "https://a.4cdn.org/%s/catalog.json" board)))
    (url-retrieve url-formatted
(lambda (_status)
	(goto-char url-http-end-of-headers)
	(let ((json-object-type 'alist)) ;; or 'plist
	    (let ((json (json-read)))
	    (message "Parsed JSON: %S" json)))))))

(defun test-json ()
  (interactive)
  (get-json "lgbt"))

(provide 'chan)
;;; chan.el ends here
