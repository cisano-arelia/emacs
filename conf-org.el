;; load path
(add-to-list 'load-path "~/emacs/contrib/org-7.7/lisp")
;; fix files
(require 'conf-org-files)
;; load org-mode
(require 'org-install)
;; delay loading till org-install is loaded
(eval-after-load "org-install"
  '(progn
     ;; Shortcuts voor org
     (global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-cc" 'org-capture)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cb" 'org-iswitchb)
     ;; release shift select mode
     (setq org-support-shift-select t)
     ;; Set timestamp when TODO => DONE
     (setq org-log-done t)
     ;; org extension
     (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
     ;; set archive location
     (defadvice org-extract-archive-file (after org-to-ref activate)
       (setq ad-return-value
	     (replace-regexp-in-string "\\.org\\.gpg_archive" ".org.archive.gpg" ad-return-value)))
     ;; contexts
     (setq org-tag-alist '((:startgroup . nil)
			   ("WERK" . ?w) ("THUIS" . ?t) ("WINKEL" . ?i)
			   (:endgroup . nil)
			   ("AGRI" . ?a) ("PRAEMIS" . ?p) ("PRAEVENTIS" . ?l) ("RVP" . ?r)))
     ;; actie statussen
     (setq org-todo-keywords
	   '((sequence "TAAK(t)" "|" "UITGEVOERD(u)")
	     (sequence "WACHT(w)" "|")
	     (sequence "NIEUW(n)" "|")
	     (sequence "AFSPRAAK(f)" "|")
	     (sequence "BELLEN(b)" "|")
	     (sequence "PROJECT(p)" "|" "AFGEROND(r)")
	     (sequence "|" "GEANNULEERD(a)")
	     (sequence "|" "GEDELEGEERD(d)")))
     ;; Set refile targets
     (setq org-refile-targets '((gtd-file-nextactions :maxlevel . 2)
				(gtd-file-projects :level . 2)
				(gtd-file-someday :level . 3)))
     ))
;; provide
(provide 'conf-org)
