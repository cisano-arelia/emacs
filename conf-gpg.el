;; turn on gpg
(require 'epa-file)
(eval-after-load "epa-file"
    '(progn
       (epa-file-enable)
       ))
;; provide
(provide 'conf-gpg)