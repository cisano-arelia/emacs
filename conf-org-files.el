;; set files
(defvar gtd-base-path "~/Dropbox/Organizer/")
(setq org-directory gtd-base-path)
(defvar gtd-file-index (concat org-directory "index/organizer.org"))
(defvar gtd-file-index-buffer "organizer.org")
(defvar gtd-file-nextactions (concat org-directory "taken.org"))
(defvar gtd-file-calendar (concat org-directory "agenda.org"))
(defvar gtd-file-projects (concat org-directory "projecten.org"))
(defvar gtd-file-someday (concat org-directory "ooit.org"))
(defvar gtd-file-anniversaries (concat org-directory "adresboek.org"))
(defvar gtd-file-journal (concat org-directory "logboek.org"))
;; provide
(provide 'conf-org-files)
