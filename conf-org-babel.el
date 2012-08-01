;; require main org config
(require 'org-install)
;; load path
(add-to-list 'load-path (concat conf-base-path "contrib/ruby/"))
;; load org-babel-ruby
(require 'ob-ruby)
;; provide
(provide 'conf-org-babel)