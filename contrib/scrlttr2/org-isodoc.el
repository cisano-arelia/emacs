(require 'org-latex-generic)
(require 'org-letter-utils)

;; An isodoc file starts in org-latex-generic-mode
(setq auto-mode-alist (append '(("\\.isodoc$" . org-latex-generic-mode))
                              auto-mode-alist))

;; Register sectioning structure for isodoc class. For now use the
;; generic routine.
(add-to-list
 'org-export-latex-classes
 '("isodoc" "\\documentclass{isodoc}" org-latex-generic-sectioning) t)

(defcustom org-latex-generic-isodoc-setup
  "
#+LaTeX_CLASS: isodoc
#+LATEX_HEADER: \\usepackage{mystyle}
#+OPTIONS: toc:nil
#+TITLE:
"
  "Meta lines for isodoc class. Insert your own stylesheet."
  :group 'org-letter-isodoc
  :type 'string)

(defvar org-latex-generic-isodoc-template
  '("letter"
    ("options"
     ("date" "to" "opening" "subject" "closing" "enclosures"))
    ("body"))
  "Outline structure for isodoc file."
  )

(defcustom org-latex-generic-isodoc-sectioning-alist
  '(("letter" . cmd-with-opt)
    ("options" . optarg)
    ("date" . option)
    ("to" . option)
    ("opening" . option)
    ("subject" . option)
    ("closing" . option)
    ("enclosures" . option)
    ("body" . arg))
  "Common LaTeX commands and Environment for use with isodoc class."
  :group 'org-letter-isodoc
  :type org-latex-generic-sectioning-config)

(provide 'org-isodoc)
