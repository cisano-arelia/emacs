;; require main org config
(require 'conf-org)
;; load path
(add-to-list 'load-path "~/emacs/contrib/ruby/")
;; delay loading till org-conf is loaded
(eval-after-load "conf-org"
  '(progn
     ;; load org-babel-ruby
     (require 'ob-ruby)
     ))
;; provide
(provide 'conf-org-babel)