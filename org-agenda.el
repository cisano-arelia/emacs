;; Turn on diary within org-mode
(setq org-agenda-include-diary t)
;; Restore window on quit agenda
(setq org-agenda-restore-windows-after-quit t)
;; Set files for agenda views
(setq org-agenda-files (list gtd-file-nextactions
			     gtd-file-projects
			     gtd-file-anniversaries
			     gtd-file-someday))	
