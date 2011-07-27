(require 'org-bbdb)

(org-add-link-type "bbdb" 'org-bbdb-open 'org-letter-utils-bbdb-export)
(defun org-letter-utils-bbdb-export (path desc format)
  "Convert a BBDB link to an address.
Customized for Indian style. Commas are a strict No No for
now. Make this sit nicely with `bbdb-format-address' and
friends."
  (when (eq format 'latex)
    (let* ((name path) (separator " \\\\\n")
           (indent 2) (prefix (make-string indent ? ))
           (addr (car (bbdb-record-addresses (bbdb-search-simple name nil)))))
      (concat
       prefix name separator
       (mapconcat (lambda (line) (concat prefix line))
                  (bbdb-address-streets addr) separator) separator
       prefix (bbdb-address-city addr) " - " (bbdb-address-zip addr) separator
       prefix (bbdb-address-state addr)))))

(provide 'org-letter-utils)