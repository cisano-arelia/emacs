(require 'org-latex-generic)
(require 'org-letter-utils)

;; An scrlttr2 file starts in org-latex-generic-mode
(setq auto-mode-alist (append '(("\\.scrlttr2$" . org-latex-generic-mode))
                              auto-mode-alist))

;; Register sectioning structure for Scrlttr2 class. For now use the
;; generic routine.

(add-to-list
 'org-export-latex-classes
 '("scrlttr2" "\\documentclass{scrlttr2}" org-latex-generic-sectioning) t)

(defcustom org-latex-generic-scrlttr2-setup  
  "
#+LaTeX_CLASS: scrlttr2
#+LaTeX_CLASS_OPTIONS: [DIN,pdj]
#+OPTIONS: toc:nil
"
  "Meta lines for scrlttr2 class. Plug in your LCO file."
  :group 'org-scrlttr2
  :type 'string)

(defvar org-latex-generic-scrlttr2-template
  '("letter"
    ("to" "subject" "opening" "body" "encl" "closing"))
  "Outline structure for scrlttr2 file."
  )

(defcustom org-latex-generic-scrlttr2-sectioning-alist
  '(("letter" . env)
    ("to" . arg)
    ("subject" . var)
    ("opening" . cmd)
    ("body" . text)
    ("encl" . cmd)
    ("closing" . cmd))
  "Common LaTeX commands and Environment for use with scrlttr2 class."
  :group 'org-letter-scrlttr2
  :type org-latex-generic-sectioning-config)

(provide 'org-scrlttr2)
