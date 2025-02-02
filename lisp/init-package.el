;;; package --- Summary: emacs package installation and configuration elisp file
;;; Commentary:
;;; Code:
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

(use-package crux
  :bind ("C-c k" . crux-smart-kill-line))

(use-package hungry-delete
  :bind (("C-c DEL" . hungry-delete-backward))
  :bind (("C-c d" . hungry-delete-forward)))

(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))

(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d/%d "
	enable-recursive-minibuffers t
	ivy-rebuilders-alist '((t . ivy--regex-ignore-order)))
  (ivy-posframe-mode 1))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))

(use-package company
  :config
  (setq company-dabbrev-code-everywhere t
	company-dabbrev-code-modes t
	company-dabbrev-code-other-buffers 'all
	company-dabbrev-downcase nil
	company-dabbrev-ignore-case t
	company-dabbrev-other-buffers 'all
	company-require-match nil
	company-minimum-prefix-length 2
	company-show-numbers t
	company-tooltip-limit 20
	company-idle-delay 0
	company-echo-delay 0
	company-tooltip-offset-display 'scrollbar
	company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))

(use-package flycheck
  :hook (after-init . global-flycheck-mode))

(use-package which-key
  :defer nil
  :config (which-key-mode))

(use-package ace-window
  :bind (("M-o" . 'ace-window)))

;; 启用 lsp-mode
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-auto-configure t)
  (setq lsp-auto-guess-root t)
  (setq lsp-restart 'auto-restart)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (python-mode . lsp-deferred)
  (c-mode . lsp-deferred)
  :config
  (push 'company-capf company-backends)
  :commands (lsp lsp-deferred))

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))  ; or lsp-deferred
 
;; 启用 lsp-ui
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t))

;; 启用 lsp-treemacs
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-S-<up>" . mc/edit-beginnings-of-lines)
         ("C-S-<down>" . mc/edit-ends-of-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package restart-emacs)

(provide 'init-package)
;;; init-package.el ends here
