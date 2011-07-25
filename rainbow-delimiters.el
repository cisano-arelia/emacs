;; load path
(add-to-list 'load-path "~/emacs/contrib/rainbow-delimiters")
;; rainbow delimiters
(require 'rainbow-delimiters) 
(eval-after-load "rainbow-delimiters"
    '(progn
       (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
       ))
