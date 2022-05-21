;; -*- lexical-binding: t; -*-

;; Configure load-path.
(push (expand-file-name "~/lib/emacs") load-path)

;; screen
(load "screen" t)

;; Swap BS and DEL.
(keyboard-translate ?\C-h ?\C-?)

;; Global keybindings
(global-set-key "\C-z\C-z" 'shell)
(global-set-key "\M-h" 'help-for-help)
;(global-set-key [mouse-4] 'previous-line)
;(global-set-key [mouse-5] 'next-line)
;(global-set-key [mouse-6] (lambda () (interactive)))

;; (my--define-fontset "test" "terminus 26" "kyokasho 24" t)
(defun my--define-fontset (fontset ascii-font unicode-font &optional activate)
  (let ((fontset-name (concat "fontset-" fontset)))
    (when (eq window-system 'x)
      (create-fontset-from-ascii-font ascii-font nil fontset)
      (set-fontset-font fontset-name 'unicode unicode-font nil 'append)
      (when activate
	(add-to-list 'default-frame-alist (cons 'font fontset-name))))))

(setq initial-buffer-choice t)


;;; Major mode
;; flylint
(autoload 'flylint-mode "flylint" nil t)

;; emacs-lisp
(global-eldoc-mode -1)
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (linum-mode 1)
	    (flylint-mode 1)))

;; c/c++
(setq c-default-style "gnu")
(add-hook 'c-mode-hook
  	  (lambda ()
	    (linum-mode 1)
	    (flylint-mode 1)))

;; perl
(add-hook 'perl-mode-hook
	  (lambda ()
	    (require 'perl-compl)
	    (local-set-key "\M-\t" 'complete-perl-symbol)
	    (local-set-key "\M-." 'find-perl-tag)
	    (local-set-key "\C-c\C-\M-\\" 'perltidy-buffer)
	    (linum-mode 1)
	    (flylint-mode 1)))

; python
(autoload 'py-mode "py-mode" nil t)
(autoload 'inf-py "py-mode" nil t)
(global-set-key "\C-cy" 'inf-py)
(add-to-list 'auto-mode-alist '("\\.py$" . py-mode))
(add-to-list 'interpreter-mode-alist (cons "python[0-9.]*" 'py-mode))
(add-hook 'py-mode-hook
  	  (lambda ()
	    (require 'py-compl)
	    (local-set-key "\M-\t" 'py-complete-symbol)
	    (local-set-key "\M-." 'py-find-tag)
	    (local-set-key "\C-c\C-\M-\\" 'py-format-buffer)
	    (linum-mode 1)
	    (flylint-mode 1)))

;; math
(autoload 'math-mode "math-mode" nil t)
(autoload 'inf-math "math-mode" nil t)
(global-set-key "\C-c," 'inf-math)
(add-to-list 'auto-mode-alist '("\\.m$" . math-mode))
(add-hook 'math-mode-hook
	  (lambda ()
	     (linum-mode 1)))

;; bibtex
(setq bibtex-autokey-name-case-convert 'capitalize)
(setq bibtex-autokey-titleword-case-convert 'capitalize)
(setq bibtex-autokey-titleword-separator "")
(setq bibtex-autokey-titleword-length 'infinity)
(setq bibtex-autokey-titlewords 1)
(setq bibtex-autokey-year-title-separator ":")

;; doc-view
;(setq doc-view-scale-internally nil)
(setq doc-view-image-width 1280)
(setq doc-view-resolution 300)
(setq doc-view-ghostscript-options
      '("-dSAFER" "-dNOPAUSE" "-sDEVICE=png16m" "-dTextAlphaBits=4" "-dBATCH"
	"-dGraphicsAlphaBits=4" "-dQUIET"
	"-dMaxBitmap=500000000" "-dAlignToPixels=0" "-dGridFitTT=2"))
(add-hook 'doc-view-mode-hook
  	  (lambda ()
	    (local-set-key "c" 'doc-annotate-add-annotation)
	    (local-set-key [mouse-1] 'doc-annotate-add-annotation)))

;; doc-annotate
(autoload 'doc-annotate-mode "doc-annotate")
(autoload 'doc-annotate-add-annotation "doc-annotate")
(add-to-list 'auto-mode-alist '("\\.ant$" . doc-annotate-mode))
(add-hook 'doc-annotate-mode-hook
  	  (lambda ()
	    (auto-fill-mode 1)))

;; pytrans
(autoload 'pytrans-translate "pytrans")
(global-set-key "\C-cT" 'pytrans-translate)

;; zf
(require 'zf)
;(zf-mode 1)

;; org
;; This must be loaded *before* org-mode initialization.
(load "config-org")

;; package
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")))
(package-initialize)


;;; X11 specific.
(when (eq window-system 'x)
  (scroll-bar-mode -1)
  (my--define-fontset
   "hiro18"
   "-hiro-maru-medium-r-normal--18-170-75-75-c-90-iso8859-1"
   "-hiro-maru-medium-r-normal--18-170-75-75-c-170-jisx0208.1990-0"
   'activate)
  ;; Face.
  (dolist (elem '((bold "LightGoldenrod")
		  (underline "PaleGreen")
		  (mode-line "black" "PaleGreen3" bold)
		  (mode-line-inactive "PaleGreen" "black")
		  (link "PaleGreen")
		  (link-visited "salmon")
		  (font-lock-builtin-face "aquamarine1")
		  (font-lock-keyword-face "aquamarine1" nil bold)
		  (font-lock-constant-face "aquamarine2")
		  (font-lock-comment-face "orange")))
    (set-face-attribute (car elem) nil
			:foreground (nth 1 elem)
			:background (nth 2 elem)
			:weight (or (nth 3 elem) 'normal)))
  ;; hl-line mode
  (global-hl-line-mode t)
  (set-face-background 'hl-line "DarkSlateGray")
  ;; misc
  (setq mouse-yank-at-point t))

;(my--define-fontset
; "terminus"
; "terminus-18"
; "VL Gothic-17")
