(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'init-startup)
(require 'init-elpa)
(require 'init-ui)
(require 'init-package)
(require 'init-const)

(when (file-exists-p custom-file)
  (load-file custom-file))
