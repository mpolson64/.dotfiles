;;; .emacs --- Personal EMACS settings by mpolson64

;;; Commentary:

;; Emacs is the primary editor I use and thus the most fully featured.  The key/largest packages include:
;; * Evil
;; * Helm
;; * Company
;; * Projectile

;;; Code:

;; Quality of life
(setq inhibit-startup-screen t)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq sentence-end-double-space nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode 1)

;; Package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Keybinding
(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1))

(use-package hydra
  :ensure t)

;; Vim emulator
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
  (define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
  (define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
  (define-key evil-normal-state-map (kbd "C-l") 'windmove-right))

;; Narrowing engine
(use-package helm
  :ensure t
  :init
  (setq helm-autoresize-mode t)
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (define-key evil-normal-state-map (kbd "SPC" )'helm-M-x)
  (defhydra helm-like-unite ()
    "vim movement"
    ("?" helm-help "help")
    ("<escape>" keyboard-escape-quit "exit")
    ("<SPC>" helm-toggle-visible-mark "mark")
    ("a" helm-toggle-all-marks "mark")

    ("/" (lambda ()
	   (interactive)
	   (execute-kbd-macro [?\C-s]))
     "search")

    ("v" helm-execute-persistent-action)
    ("g" helm-beginning-of-buffer "top")
    ("G" helm-end-of-buffer "bottom")
    ("j" helm-next-line "down")
    ("k" helm-previous-line "up")
    ("i" nil "cancel"))

  (key-chord-define minibuffer-local-map "jk" 'helm-like-unite/body))

;; Autocompleters
(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0.1)
  (setq company-selection-wrap-around t)
  :config
  (global-company-mode 1)

  (defhydra company-like-vim ()
    "vim movement"
    ("j" company-select-next "down")
    ("k" company-select-previous "up")
    ("i" nil "cancel"))

  (key-chord-define company-active-map "jk" 'company-like-vim/body))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; File manipulation
(use-package helm-projectile
  :ensure t
  :config
  (projectile-global-mode 1)
  (define-key evil-normal-state-map (kbd "C-p") 'helm-projectile))

;; Code style and sytax
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode 1))

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode 1))

(use-package evil-smartparens
  :ensure t
  :init
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; Language specific modes
(use-package anaconda-mode
  :ensure t  
  :config
  (add-hook 'python-mode-hook 'anaconda-mode))
(use-package company-anaconda
  :ensure t
  :config 
  (add-to-list 'company-backends 'company-anaconda))

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode))

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; Org
(require 'org)

(add-hook 'org-mode-hook 'visual-line-mode t)
(add-hook 'org-mode-hook 'flyspell-mode)

(define-key org-mode-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key org-mode-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key org-mode-map (kbd "<remap> <evil-beginning-of-line>") 'evil-beginning-of-visual-line)
(define-key org-mode-map (kbd "<remap> <evil-end-of-line>") 'evil-end-of-visual-line)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Utilities
(use-package magit
  :ensure t
  :config
  (define-key magit-mode-map (kbd "j") 'magit-section-forward)
  (define-key magit-mode-map (kbd "k") 'magit-section-backward))

;;UI elements
(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme)
  (setq powerline-default-separator 'slant))

(use-package evil-anzu
  :ensure t)

(use-package golden-ratio
  :ensure t
  :config
  (golden-ratio-mode 1))

(use-package emojify
  :ensure t
  :config
  (global-emojify-mode 1))

(use-package spacemacs-theme
  :ensure t
  :init
  (load-theme 'spacemacs-dark t))

;; Make company and yasnippet play nice

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
	(backward-char 1)
	(if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas-fallback-behavior 'return-nil))
    (yas-expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (cond
   ((minibufferp)
    (minibuffer-complete))
   (t
    (indent-for-tab-command)
    (if (or (not yas-minor-mode)
	    (null (do-yas-expand)))
	(if (check-expansion)
	    (progn
	      (company-manual-begin)
	      (if (null company-candidates)
		  (progn
		    (company-abort)
		    (indent-for-tab-command)))))))))

(defun tab-complete-or-next-field ()
  (interactive)
  (if (or (not yas-minor-mode)
	  (null (do-yas-expand)))
      (if company-candidates
	  (company-complete-selection)
	(if (check-expansion)
	    (progn
	      (company-manual-begin)
	      (if (null company-candidates)
		  (progn
		    (company-abort)
		    (yas-next-field))))
	  (yas-next-field)))))

(defun expand-snippet-or-complete-selection ()
  (interactive)
  (if (or (not yas-minor-mode)
	  (null (do-yas-expand))
	  (company-abort))
      (company-complete-selection)))

(defun abort-company-or-yas ()
  (interactive)
  (if (null company-candidates)
      (yas-abort-snippet)
    (company-abort)))

(global-set-key [tab] 'tab-indent-or-complete)
(global-set-key (kbd "TAB") 'tab-indent-or-complete)
(global-set-key [(control return)] 'company-complete-common)

(define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
(define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

(define-key yas-minor-mode-map [tab] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(define-key yas-keymap [tab] 'tab-complete-or-next-field)
(define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
(define-key yas-keymap [(control tab)] 'yas-next-field)
(define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)

(provide '.emacs)

;;; .emacs ends here
