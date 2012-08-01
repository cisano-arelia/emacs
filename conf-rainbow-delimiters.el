;; load path
(add-to-list 'load-path (concat conf-base-path "contrib/rainbow-delimiters"))
;; rainbow delimiters
(require 'rainbow-delimiters)
(eval-after-load "rainbow-delimiters"
    '(progn
       (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
       ))
;; provide
(provide 'conf-rainbow-delimiters)
