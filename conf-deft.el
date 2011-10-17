;; load path
(add-to-list 'load-path "~/emacs/contrib/deft")
;; http://jblevins.org/projects/deft/
(when (require 'deft nil 'noerror) 
   (setq
      deft-extension "org"
      deft-directory "~/Dropbox/Organizer/notes/"
      deft-text-mode 'org-mode)
   (global-set-key (kbd "<f9>") 'deft))
;; provide
(provide 'conf-deft)
