;; set files
(setq org-directory "~/Dropbox/Organizer/")
(defvar gtd-file-index (concat org-directory "index/organizer.org"))
(defvar gtd-file-index-buffer "organizer.org")
(defvar gtd-file-nextactions (concat org-directory "taken.org.gpg"))
(defvar gtd-file-calendar (concat org-directory "agenda.org.gpg"))
(defvar gtd-file-projects (concat org-directory "projecten.org.gpg"))
(defvar gtd-file-someday (concat org-directory "ooit.org.gpg"))
(defvar gtd-file-anniversaries (concat org-directory "adresboek.org.gpg"))
(defvar gtd-file-journal (concat org-directory "logboek.org.gpg"))
;; provide
(provide 'conf-org-files)