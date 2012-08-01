;; start daemon
(server-start)
;; open file thru server in new frame
(add-hook 'server-switch-hook
          (lambda nil
            (let ((server-buf (current-buffer)))
              (bury-buffer)
              (switch-to-buffer-other-frame server-buf))))
(add-hook 'server-done-hook 'delete-frame)
(add-hook 'server-done-hook (lambda nil (kill-buffer nil)))
;; close frame+buffer
(defun closeFrameAndBuffer ()
       (interactive)
       (kill-buffer nil)
       (delete-frame)
)
(global-set-key (kbd "C-x c") 'closeFrameAndBuffer)
;; provide
(provide 'conf-daemon)