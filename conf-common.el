;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)
;; custom settings in seperate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
;; turn on row+column numbering
(column-number-mode)
;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)
(set-variable 'confirm-kill-emacs 'yes-or-no-p)
;; try to improve slow performance on windows.
(setq w32-get-true-file-attributes nil)
;; write as dos
(setq-default buffer-file-coding-system 'raw-text-dos)
;; provide
(provide 'conf-common)