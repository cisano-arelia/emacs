;; load path
(add-to-list 'load-path "~/emacs/contrib/tempbuf")
;; undo/redo
(require 'tempbuf)
(eval-after-load "tempbuf"
    '(progn
       (add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
       (add-hook 'custom-mode-hook 'turn-on-tempbuf-mode)
       (add-hook 'w3-mode-hook 'turn-on-tempbuf-mode)
       (add-hook 'Man-mode-hook 'turn-on-tempbuf-mode)
       (add-hook 'view-mode-hook 'turn-on-tempbuf-mode)
;;     (add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
     ))
;; provide
(provide 'conf-tempbuf)