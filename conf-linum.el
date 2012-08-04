;; load path
(add-to-list 'load-path (concat conf-base-path "contrib/linum"))
;; load linum-off which loads linum!
(require 'linum-off)
;; load in background
(eval-after-load "linum-off"
    '(progn
       (add-hook 'find-file-hook 'linum-on)
       ))
;; provide
(provide 'conf-linum)
