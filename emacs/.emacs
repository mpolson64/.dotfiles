(setq inhibit-startup-screen t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
    (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t)
(use-package key-chord
  :ensure t)
(use-package helm
  :ensure t)
(use-package company
  :ensure t)
(use-package smartparens
  :ensure t)
(use-package evil-surround
  :ensure t)
(use-package evil-smartparens
  :ensure t)
(use-package magit
  :ensure t)
(use-package monokai-theme
  :ensure t)

(evil-mode 1)
(key-chord-mode 1)
(global-company-mode 1)
(smartparens-global-mode 1)
(global-evil-surround-mode 1)
(global-linum-mode 1)

(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

(setq helm-autoresize-mode t)

(setq company-idle-delay 0.1)
(setq company-selection-wrap-around t)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(global-set-key (kbd "M-x") 'helm-M-x)
(define-key company-active-map [tab] 'company-comlete)
(define-key company-active-map (kbd "C-j") 'company-select-next)
(define-key company-active-map (kbd "C-k") 'company-select-previous)

(load-theme 'monokai t)
