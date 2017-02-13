;;; .emacs --- Personal EMACS settings by mpolson64

;;; Commentary:

;; Emacs is the primary editor I use and thus the most fully featured.  The key/largest packages include:
;; * Evil
;; * Helm
;; * Company
;; * Projectile

;;; Code:

(setq inhibit-startup-screen t)
(defalias 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
    (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1))
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
  (define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
  (define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
  (define-key evil-normal-state-map (kbd "C-l") 'windmove-right))

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)
  :bind
  ("M-x" . helm-M-x)
  :init
  (setq helm-autoresize-mode t))
(use-package company
  :ensure t
  :config
  (global-company-mode 1)
  (define-key company-active-map [tab] 'company-comlete)
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)
  :init
  (setq company-idle-delay 0.1)
  (setq company-selection-wrap-around t))
(use-package helm-projectile
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
  :init
  (global-projectile-mode 1))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))
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
(use-package evil-anzu
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package magit
  :ensure t
  :config
  (define-key magit-mode-map (kbd "j") 'magit-section-forward)
  (define-key magit-mode-map (kbd "k") 'magit-section-backward))

(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme)
  (setq powerline-default-separator 'slant))
(use-package golden-ratio
  :ensure t
  :init
  (golden-ratio-mode 1))
(use-package emojify
  :ensure t
  :config
  (global-emojify-mode))
(use-package spacemacs-theme
  :ensure t
  :init
  (load-theme 'spacemacs-dark t))
(provide '.emacs)

;;; .emacs ends here
