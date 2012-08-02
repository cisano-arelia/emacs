;; set utf8
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; in case of windows set clipboard coding system
(if (eq system-type 'windows-nt)
   (set-clipboard-coding-system 'utf-16le-dos)
)
;; provide
(provide 'conf-locale)
