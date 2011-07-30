;; require main org config
(require 'conf-org)
;; delay loading till org-conf is loaded
(eval-after-load "conf-org"
  '(progn
     ;; load org-babel-ruby
     (require 'ob-ruby)
     ))
;; provide
(provide 'conf-org-babel)