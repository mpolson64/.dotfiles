(setq inhibit-startup-screen t)

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
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))
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
  (define-key company-active-map (kbd "C-k") 'company-select-previous))
(use-package projectile
  :ensure t
  :config
  (projectile-mode 1)
  :init
  (setq company-idle-delay 0.1)
  (setq company-selection-wrap-around t))
(use-package helm-projectile
  :ensure t)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))
(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode 1))
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
(use-package evil-smartparens
  :ensure t
  :init
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))
(use-package magit
  :ensure t)
(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme))
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
(use-package emojify
  :ensure t
  :config
  (global-emojify-mode))
(use-package monokai-theme
  :ensure t
  :init
  (load-theme 'monokai t))

(global-linum-mode 1)
