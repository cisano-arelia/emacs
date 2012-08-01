;; require main org config
(require 'org-install)
(require 'org-latex)
(setq org-export-latex-listings t)
;; allow bind
(setq org-export-allow-BIND t)
;; use xetex
(setq org-latex-to-pdf-process (list "latexmk -pdflatex=xelatex -pdf -quiet %f"))
;; Specify default packages to be included in every tex file, whether pdflatex or xelatex
(setq org-export-latex-packages-alist
      '(("" "graphicx" t)
            ("" "longtable" nil)
            ("" "float" nil)))
;; Packages to include when xelatex is used
(setq org-export-latex-default-packages-alist
                '(("" "fontspec" t)
                  ("" "xunicode" t)
                  ("" "url" t)
                  ("" "rotating" t)
                  ("dutch" "babel" t)
                  ("babel" "csquotes" t)
                  ("" "soul" t)
                  ("xetex" "hyperref" nil)
                  ))
;; open LCO as latex
(add-to-list 'auto-mode-alist '("\\.lco$" . latex-mode))
;; set beamer/article latex export
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("beamer"
               "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{hyperref}\n
      \\usepackage{color}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n
       \\subject{{{{beamersubject}}}}\n"

                    ("\\section{%s}" . "\\section*{%s}")

                    ("\\begin{frame}[fragile]\\frametitle{%s}"
                     "\\end{frame}"
                     "\\begin{frame}[fragile]\\frametitle{%s}"
                     "\\end{frame}")))
(add-to-list 'org-export-latex-classes
                  '("article"
                    "\\documentclass[11pt,a4paper,twoside]{article}\n
\\usepackage[a4paper]{geometry}\n
\\geometry{left=1.0cm,top=1.0cm,bottom=2.0cm, right=1.0cm}\n
\\setlength{\\columnseprule}{1pt}\n
\\setlength{\\columnsep}{1.3cm}\n
\\usepackage[dutch]{babel}\n
\\usepackage[hyperref,x11names]{xcolor}\n
\\usepackage[colorlinks=true,urlcolor=SteelBlue4,linkcolor=Firebrick4]{hyperref}\n
"
                    ("\\section{%s}" . "\\section*{%s}")
                    ("\\subsection{%s}" . "\\subsection*{%s}")
                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                    ("\\paragraph{%s}" . "\\paragraph*{%s}")
                    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; load path
(add-to-list 'load-path (concat conf-base-path "contrib/scrlttr2"))
;; scrlttr2 support
(require 'org-isodoc)
(require 'org-scrlttr2)
;; provide
(provide 'conf-org-latex)