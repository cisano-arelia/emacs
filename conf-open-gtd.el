(require 'conf-org)
;; open GTD index as default
(defun gtd ()
  (interactive)
  (if (not (not (eq nil (get-buffer gtd-file-index-buffer))))
      (find-file-read-only gtd-file-index)
    )
  (switch-to-buffer gtd-file-index-buffer)
  (delete-other-windows)
  )
(global-set-key (kbd "C-c g") 'gtd)
(gtd)
;; provide
(provide 'conf-open-gtd)