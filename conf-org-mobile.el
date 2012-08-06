;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull gtd-file-nextactions)
;; Set files
(setq org-mobile-files (list gtd-file-nextactions
			     gtd-file-projects))
;; Set to MobileOrg directory
(setq org-mobile-directory (concat org-directory "mobile"))
;; is variable bound?
(when (boundp 'gtd-org-mobile-encryption-password)
    ;; Enable encryption
    (setq org-mobile-use-encryption t)
    ;; Set a password
    (setq org-mobile-encryption-password gtd-org-mobile-encryption-password)
)
;; provide
(provide 'conf-org-mobile)
