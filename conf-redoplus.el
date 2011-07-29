;; load path
(add-to-list 'load-path "~/emacs/contrib/redoplus")
;; undo/redo
(require 'redoplus)
(eval-after-load "redoplus"
    '(progn
       (global-set-key (kbd "C-z") 'undo)
       (global-set-key (kbd "C-S-z") 'redo)
       (setq undo-no-redo t)
       ))
;; provide
(provide 'conf-redoplus)
