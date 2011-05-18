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

;; Installation
;; Configure your load-path and call require
;; (require 'hungry-delete)

;; add-hook to use in specific modes
;; (add-hook 'tuareg-mode-hook #'(lambda () (hungry-keyboard tuareg-mode-map)))
;; (add-hook 'ruby-mode-hook #'(lambda () (hungry-keyboard ruby-mode-map)))

;; or use in default key-map
;; (hungry-keyboard global-map)

(provide 'hungry-delete)