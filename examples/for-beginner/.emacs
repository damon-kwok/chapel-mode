(require 'package)
(unless package--initialized (package-initialize))

;;; `y-or-n-p'
(fset 'yes-or-no-p 'y-or-n-p)

;;; `package-download'
(defun package-download (pkg)
  (when (not (package-installed-p pkg))
    (progn (unless package-archive-contents (package-refresh-contents))
      (package-install pkg))))

;;; display line numbers
(if (version<= "26.0.50" emacs-version )
  (progn
    (require 'display-line-numbers)
    (global-display-line-numbers-mode 1))
  (progn
    (setq linum-mode t)
    (setq linum-format "%4d")
    (global-linum-mode 1)))

;;; display column number
(setq column-number-mode t)

;;; `whitespace' settings
(require 'whitespace)
(setq whitespace-style ;;
  '(face spaces tabs newline space-mark tab-mark newline-mark trailing))
;; Make whitespace-mode and whitespace-newline-mode
;; use "¶" for end of line char and "▷" for tab.
(setq whitespace-display-mappings
  ;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
  ;; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
  '((space-mark 32 [183] [46])
     (newline-mark 10 [182 10])
     (tab-mark 9 [9655 9] [92 9])))

;;; `company' settings
(package-download 'company)
(require 'company)
(package-download 'company-ctags)
(require 'company-ctags)
(with-eval-after-load 'company (company-ctags-auto-setup))

;;; `rainbow-delimiters' settings
(require 'rainbow-delimiters)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(rainbow-delimiters-depth-1-face ((t
                                       (:foreground "SlateGray"))))
  '(rainbow-delimiters-depth-2-face ((t
                                       (:foreground "LightGreen"))))
  '(rainbow-delimiters-depth-3-face ((t
                                       (:foreground "SeaGreen"))))
  '(rainbow-delimiters-depth-4-face ((t
                                       (:foreground "khaki"))))
  '(rainbow-delimiters-depth-5-face ((t
                                       (:foreground "HotPink2"))))
  '(rainbow-delimiters-depth-6-face ((t
                                       (:foreground "DarkGreen"))))
  '(rainbow-delimiters-depth-7-face ((t
                                       (:foreground "DodgerBlue"))))
  '(rainbow-delimiters-depth-8-face ((t
                                       (:foreground "orange"))))
  '(rainbow-delimiters-depth-9-face ((t
                                       (:foreground "brown")))))

;;; `fci' settings
(package-download 'fill-column-indicator)
(require 'fill-column-indicator)
(setq fci-rule-column 80)
(setq fci-handle-truncate-lines nil)
(setq fci-rule-width 1)
(setq fci-rule-color "grey30")

;;; `hl-todo' settings
(package-download 'hl-todo)
(require 'hl-todo)
(setq hl-todo-keyword-faces ;;
  '(("TODO" . "green")
     ("FIXME" . "yellow")
     ("DEBUG" . "DarkCyan")
     ("GOTCHA" . "red")
     ("STUB" . "DarkGreen")))
(define-key hl-todo-mode-map (kbd "C-c p") 'hl-todo-previous)
(define-key hl-todo-mode-map (kbd "C-c n") 'hl-todo-next)
(define-key hl-todo-mode-map (kbd "C-c o") 'hl-todo-occur)

;;; `nyan-mode'
(package-download 'nyan-mode)
(if (display-graphic-p)
  (progn
    (require 'nyan-mode)
    (nyan-start-animation)
    (nyan-mode 1)))

;;; `chapel' settings
(package-download 'chapel-mode)
(require 'chapel-mode)

(setq chapel-use-ctags t)
(setq chapel-format-on-save t)

(define-key chapel-mode-map (kbd "<f6>")  'chapel-menu)
(define-key chapel-mode-map (kbd "C-c C-f") 'chapel-format-buffer)

(add-hook 'chapel-mode-hook ;;
  #'(lambda ()
      (whitespace-mode 1)
      (hl-todo-mode 1)
      (fci-mode 1)
      (rainbow-delimiters-mode 1)))
