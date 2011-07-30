;; require main org config
(require 'conf-org)
;; delay loading till org-conf is loaded
(eval-after-load "conf-org"
  '(progn
     ;; indent
     (setq org-startup-indented t)
     ;; hide stars
     (setq org-hide-leading-stars t)
     ;; niet folded
     (setq org-startup-folded "content")
     ;; Set outline ellipsis
     (set-display-table-slot
      standard-display-table
      'selective-display
      (let ((face-offset (* (face-id 'shadow) (lsh 1 22))))
	(vconcat (mapcar (lambda (c) (+ face-offset c)) " * "))))
     ))
;; provide
(provide 'conf-org-layout)