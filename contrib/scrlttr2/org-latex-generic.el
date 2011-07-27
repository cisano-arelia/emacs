(require 'org)
(require 'org-latex)

(defvar org-latex-classes nil)
(defvar org-latex-generic-sectioning-config
  '(alist :tag "Org LaTeX Generic Known Headings"
          :key-type
          (string :tag "heading")
          :value-type
          (choice
           (const :tag "environment" env)                 
           (const :tag "var" var)
           (const :tag "command" cmd)
           (const :tag "command-with-options" cmd-with-opt)              
           (const :tag "options" optarg)
           (const :tag "option" option)
           (const :tag "arg" arg)
           (const :tag "text" text))))


(define-minor-mode org-latex-generic-mode
  "Fill an empty file with Org outline tree for easy editing.
The extension of the file serves as an indication of the target
LaTeX class."
  nil " LaTex Generic" nil
  (org-mode)

  (let ((class (file-name-extension buffer-file-name)))

    ;; FIXME: These should be buffer local variables for various
    ;; generic classes to coexist. For now have them as global.

    ;; The main problem is that sectioning callback happens with tex
    ;; file as current buffer and not the original org file in which
    ;; these variables are set.

    (setq org-latex-generic-class class
          org-latex-generic-setup
          (symbol-value
           (intern (format "org-latex-generic-%s-setup" class)))

          org-latex-generic-template
          (symbol-value
           (intern (format "org-latex-generic-%s-template" class)))

          org-latex-generic-sectioning-alist
          (symbol-value
           (intern (format "org-latex-generic-%s-sectioning-alist" class))))

    (when (= (point-min) (point-max))
      (insert org-latex-generic-setup)
      (org-latex-generic-insert-template))))

(defun org-latex-generic-insert-template (&optional template level)
  "Inserts an Org outline structure for the user to fill in.
See `org-latex-generic-isodoc-template' and
`org-latex-generic-scrlttr2-template' for example."
  (interactive)

  (setq template (or template org-latex-generic-template))
  (goto-char (point-max))
  (setq level (or level 1))
  (dolist (e template)
    (if (not (listp e))
        (insert  "\n" (make-string level ?*) " " e "\n")
      (org-latex-generic-insert-template e (+ level 1)))))

(defun org-latex-generic-sectioning (level heading)
  "Rules for emitting Org headings as LaTeX fragments.
Currently a heading could be configured to start a LaTeX
environment, emit a LaTeX command, set optional arguments (with
heading as key and entry body as value) and mandatory
arguments. See `org-latex-generic-scrlttr2-sectioning-alist' and
`org-latex-generic-isodoc-sectioning-alist'. "
  (let* ((heading (replace-regexp-in-string "\\s-+" "" heading))
         (pair (assoc-string heading org-latex-generic-sectioning-alist t))
         open close)

    (when pair
      (cond
       ((eq (cdr pair) 'env)
        (setq open (format "\\begin{%s}\n" (car pair))
              close (format "\\end{%s}" (car pair))))
       ((eq (cdr pair) 'var)
        (setq open (format "\n\\setkomavar{%s} {"  (car pair))
              close "}"))
       ((eq (cdr pair) 'cmd)
        (setq open "\n\\%s {"
              close "}"))
       ((eq (cdr pair) 'cmd-with-opt)
        (setq open "\n\\%s"
              close ""))
       ((eq (cdr pair) 'optarg)
        (setq open "[" close "]"))
       ((eq (cdr pair) 'option)
        (setq open (format "%s =" (car pair)) close ","))
       ((eq (cdr pair) 'arg)
        (setq open " {" close "}"))
       ((eq (cdr pair) 'text)
        (setq open "" close ""))))
    (remove-list-of-text-properties 0 (length heading) '(target) heading)
    (list heading open close open close)))

(provide 'org-latex-generic)