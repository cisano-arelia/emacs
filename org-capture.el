;; Turn on Capture
(setq org-default-notes-file gtd-file-nextactions)
;; Capture templates
(setq org-capture-templates
  `(
   ("p" "Postvak" entry (file+headline ,gtd-file-nextactions "Postvak") "* NIEUW %?")
   ("t" "Telefoon" entry (file+headline ,gtd-file-nextactions "Postvak") "** BELLEN %?")
   ("l" "Logboek" entry (file+datetree ,gtd-file-journal) "** %?")
   )
)
;; Capture template shortcut
(define-key global-map "\C-cp"
        (lambda () (interactive) (org-capture nil "p")))
(define-key global-map "\C-ct"
        (lambda () (interactive) (org-capture nil "t")))
(define-key global-map "\C-cl"
        (lambda () (interactive) (org-capture nil "l")))
