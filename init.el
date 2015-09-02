;;  _   _ _      _          _____                          
;; | \ | (_) ___| | _____  | ____|_ __ ___   __ _  ___ ___ 
;; |  \| | |/ __| |/ / __| |  _| | '_ ` _ \ / _` |/ __/ __|
;; | |\  | | (__|   <\__ \ | |___| | | | | | (_| | (__\__ \
;; |_| \_|_|\___|_|\_\___/ |_____|_| |_| |_|\__,_|\___|___/
;;                                                         
;; Config file used by nickf
;;

;; emacs is a edit server
(server-start)
					;
;; package setup
(require 'package)
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("MELPA - Milkbox" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; IDO mode on by default, for anything that helm doesn't cover I guess
(require 'ido)
(ido-mode t)

;; i need big text to read
(if (or (string= (system-name) "0930-nfunnell")
        (string= (system-name) "0930-nfunnell.twilio.internal"))
    (set-face-attribute 'default nil :height 200)
  (set-face-attribute 'default nil :height 160))

;; theme
(load-theme 'tango-dark)

;; spelling support
(setq ispell-program-name "ispell")

;; php files open in PHP Mode
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

;; Movement

(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "C-c C-g") 'avy-goto-line)
(global-set-key (kbd "C-S-n") 'end-of-buffer)
(global-set-key (kbd "C-S-p") 'beginning-of-buffer)
(setq scroll-error-top-bottom t) ; when I keep hitting page down, send the cursor to the end of the buffer

;; better beginning of line action 
;; from http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; ----- end movement

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this) ; select something, press C-d to add selection
(global-set-key (kbd "C-l") 'mc/edit-lines) ; select several lines, use C-l to put cursor on every line

;; Company Mode
(require 'company)
(global-company-mode)
(global-set-key (kbd "C-t") 'company-complete)


;  _   _      _
; | | | | ___| |_ __ ___
; | |_| |/ _ \ | '_ ` _ \
; |  _  |  __/ | | | | | |
; |_| |_|\___|_|_| |_| |_|
;

(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(helm-mode 1)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; ======================

;; show where file ends
(setq default-indicate-empty-lines t)

;; turn off toolbar
(tool-bar-mode 0)
(menu-bar-mode 0)

;; anzu 
(global-anzu-mode 1)

;; ============== STOP EDITING
;; ============== 
;; ============== just stuff set by emacs Custom after here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" default)))
 '(inhibit-startup-screen t)
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
