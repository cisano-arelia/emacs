;; require iswitchb and edmacro
(require 'edmacro)
(require 'iswitchb)
;; load in background
(eval-after-load "iswitchb"
    '(progn
       ;; turn on iswitch
       (iswitchb-mode 1)
       ;; ignore some buffers
       (setq iswitchb-buffer-ignore '("^ " "*Buffer"))
       ;; don't jump to another frame
       (setq iswitchb-default-method 'samewindow)
       ;; enable right/left cursor keys and disable up/down
       (defun iswitchb-local-keys ()
	 (mapc (lambda (K)
		 (let* ((key (car K)) (fun (cdr K)))
		   (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	       '(("<right>" . iswitchb-next-match)
		 ("<left>"  . iswitchb-prev-match)
		 ("<up>"    . ignore             )
		 ("<down>"  . ignore             ))))
       ;; bind above function to hook
       (add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)
       ))
;; provide
(provide 'conf-iswitchb)
