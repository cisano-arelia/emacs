;; enable ps printing
(setq ps-printer-name t)
(setq ps-lpr-command "gswin32c.exe")
(setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH"
			"-sDEVICE=mswinpr2"
			"-sPAPERSIZE=a4"))
