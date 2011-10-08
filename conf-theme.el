;; load path
(add-to-list 'load-path "~/emacs/contrib/color-theme")
(add-to-list 'load-path "~/emacs/contrib/color-theme/themes")
;; load color-theme
(require 'color-theme)
;;(eval-after-load "color-theme"
;;    '(progn
     (color-theme-initialize)
     (require 'color-theme-zenburn)
     (color-theme-zenburn)
     ;; font more readable (INSTALL DejaVu Sans Mono font)
     (custom-set-faces
      '(default ((t (:inherit nil :stipple nil :background nil :foreground "#d0d0d0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 112 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
     ;; current line highlight
     (global-hl-line-mode 1)
     ;; cursor shape by status
     (setq djcb-read-only-color       "gray")
     (setq djcb-read-only-cursor-type 'hbar)
     (setq djcb-overwrite-color       "red")
     (setq djcb-overwrite-cursor-type 'box)
     (setq djcb-normal-color          "yellow")
     (setq djcb-normal-cursor-type    'bar)
     (defun set-cursor-according-to-mode ()
       "change cursor color and type according to some minor modes."
       (cond
	(buffer-read-only
	 (set-cursor-color djcb-read-only-color)
	 (setq cursor-type djcb-read-only-cursor-type))
	(overwrite-mode
	 (set-cursor-color djcb-overwrite-color)
	 (setq cursor-type djcb-overwrite-cursor-type))
	(t
	 (set-cursor-color djcb-normal-color)
	 (setq cursor-type djcb-normal-cursor-type))))
     (add-hook 'post-command-hook 'set-cursor-according-to-mode)
     ;; frame title
     (setq frame-title-format
	   '("emacs%@" (:eval (system-name)) ": " (:eval (if (buffer-file-name)
							     (abbreviate-file-name (buffer-file-name))
							   "%b")) " [%*]"))
     ;; disable splash
     (setq inhibit-splash-screen t)
     ;; turn off toolbar
     (tool-bar-mode -1)
     ;; font lock mode
     (global-font-lock-mode 1)
     ;; mouse avoid
     (mouse-avoidance-mode 'cat-and-mouse)
;;     ))
;; provide
(provide 'conf-theme)
