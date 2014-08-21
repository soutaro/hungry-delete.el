;;; hungry-delete.el --- Delete following / preceeding white spaces

;; Copyright (c) 2011 Soutaro Matsumoto

;; Author: Soutaro Matsumoto
;; Version: 1.0
;; Package-Requires: ()
;; URL: https://github.com/soutaro/hungry-delete.el

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;; Installation
;; Configure your load-path and call require
;; (require 'hungry-delete)

;; add-hook to use in specific modes
;; (add-hook 'tuareg-mode-hook #'(lambda () (hungry-keyboard tuareg-mode-map)))
;; (add-hook 'ruby-mode-hook #'(lambda () (hungry-keyboard ruby-mode-map)))

;; or use in default key-map
;; (hungry-keyboard global-map)

;;; Code:

(defun hungry-backspace (arg)
  "Deletes preceding character or all whitespaces."
  (interactive "*P")
  (let ((here (point)))
    (skip-chars-backward " \t")
    (if (/= (point) here)
        (delete-region (point) here)
      (delete-backward-char 1))))

(defun hungry-delete (arg)
  "Deletes following character or all white spaces and new lines."
  (interactive "*P")
  (let ((here (point)))
    (skip-chars-forward " \t\n")
    (if (/= (point) here)
	(delete-region (point) here)
      (delete-char 1))))

(defun hungry-keyboard (map)
  (define-key map [backspace] 'hungry-backspace)
  (define-key map [delete] 'hungry-delete)
  (define-key map "\C-d" 'hungry-delete)
  (setq indent-tabs-mode nil))

(provide 'hungry-delete)
;;; hungry-delete.el ends here
