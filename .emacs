;;; package -- Emacs init

;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:

(require 'package)
;;(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
;;			 ("org" . "https://orgmode.org/elpa/")
;;                         ("melpa" . "https://melpa.org/melpa/")))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)


(package-initialize)

(set 'p-selected-packages '(web-mode js2-mode json-mode company company-box paredit clj-refactor clojure-mode cider ivy ivy-posframe rainbow-delimiters color-theme-modern helm restart-emacs projectile magit neotree all-the-icons auto-complete))

(mapc (lambda (p) (unless (package-installed-p p) (package-install p t)))
      p-selected-packages)

;; (load-theme 'aalto-dark t t)
;; (enable-theme 'aalto-dark)

;; (load-theme 'railscast t t)
;; (enable-theme 'railscast)

;; railscast

;; (user-package color-theme-modern)

;; (use-package lsp-mode
;;   :config
;;   (add-hook 'python-mode-hook #'lsp)
;;   (add-hook 'clojure-mode-hook #'lsp)
;;   (add-hook 'c-mode-hook #'lsp)
;;   (add-hook 'c++-mode-hook #'lsp)
;;   (add-hook 'rust-mode-hook #'lsp))

;; (use-package lsp-mode
;;   :config
;;   (add-hook 'python-mode-hook
;;             (lambda () (lsp-python-enable)))
  ;; 调用 pyls 既上边安装的 Python Language Server
  ;; 不需要安装 lsp-python, 以下几行提供与 lsp-python 相同的功能
  ;; (lsp-define-stdio-client lsp-python "python"
  ;;                          (lsp-make-traverser #'(lambda (dir)
  ;;                                                  (directory-files
  ;;                                                   dir
  ;;                                                   nil
  ;;                                                   "\\(__init__\\|setup\\)\\.py\\|Pipfile")))
  ;;                          '("pyls")))

;; (use-package lsp-imenu
;;     :init
;;     ;; 启用 lsp-imenu 集成
;;     (add-hook 'lsp-after-open-hook 'lsp-enable-imenu))

;; (use-package lsp-ui
;;     :init
;;     (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;;     (add-hook 'python-mode-hook 'flycheck-mode))

;; (use-package company-lsp
;;     :config
;;     (push 'company-lsp company-backends))

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'clj-refactor-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; (cljr-add-keybindings-with-prefix "C-c C-r")

;; () () (a-string)
;; (setq clojure-toplevel-inside-comment-form 1)

;; (use-package company
;;   :ensure t
;;   :config
;;   (global-company-mode 1))

;; (company-box-mode 1)

;; (setq company-idle-delay nil)
;; (define-key company-mode-map (kbd "<tab>") 'company-indent-or-complete-common)

(auto-complete-mode)
(ac-config-default)

;;(use-package org-bullets
;;  :ensure t
;;  :config
;;  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;(setq command-line-default-directory "/opt/mdmforum/ppmessage/ppmessage/ppkefu/")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; http://www.flycheck.org/manual/latest/index.html
;; (require 'flycheck)

;; turn on flychecking globally
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
;; (setq-default flycheck-disabled-checkers
;;               (append flycheck-disabled-checkers
;;                       '(javascript-jshint)))

;; use eslint with web-mode for jsx files
;;(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
;; (setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
;; (setq-default flycheck-disabled-checkers
;;               (append flycheck-disabled-checkers
;;                       '(json-jsonlist)))

(add-to-list 'default-frame-alist '(foreground-color . "#FFFFFF"))
(add-to-list 'default-frame-alist '(background-color . "#000000"))

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)

;;; (prefer-coding-system 'chinese-gb18030-unix)

;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; (setq initial-frame-alist (quote ((fullscreen . maximized))))

(require 'org)
(setq org-src-fontify-natively t)

(delete-selection-mode 1)
(global-linum-mode 1)
(blink-cursor-mode t)
(show-paren-mode t)
(global-font-lock-mode t)
(global-hl-line-mode t)
(show-paren-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(mouse-avoidance-mode 'animate)

(setq-default indent-tabs-mode nil)
(setq auto-save-default nil)
(setq visible-bell nil)
(setq kill-ring-max 200)
(setq uniquify-buffer-name-style 'forward)
(setq-default indent-tabs-mode nil)
(transient-mark-mode t)
(column-number-mode t)
(show-paren-mode t)
(global-set-key [(f2)] 'set-mark-command)
(global-set-key [(control space)] nil)
(global-set-key [(s-return)] 'toggle-frame-fullscreen)
(setq-default cursor-type 'bar)
(setq make-backup-files nil)

;;'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; For Linux
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(global-set-key (kbd "<s-f12>") 'toggle-frame-fullscreen)

(set-face-attribute 'default nil
                    ;; :family "Inconsolata"
                    :family "Monospace"
                    :height 320
                    :weight 'normal)

;; (set-frame-font "32")

;; (setq frame-title-format
;;       '("  GNU Emacs   -   [ " (buffer-file-name "%f \]"
;;                	                                 (dired-directory dired-directory "%b \]"))
;; 	    )
;;       )


;; (defun delete-word (arg)
;;   "Delete characters forward until encountering the end of a word.
;;   With argument, do this that many times."
;;   (interactive "p")
;;   (delete-region (point) (progn (forward-word arg) (point))))

;; (defun backward-delete-word (arg)
;;   "Delete characters backward until encountering the end of a word.
;;   With argument, do this that many times."
;;   (interactive "p")
;;   (delete-word (- arg)))

;; (global-set-key (read-kbd-macro "<M-DEL>") 'backward-delete-word)

;; (setq org-agenda-files (list "~/org-agenda-file.org"))

;; 设置默认 Org Agenda 文件目录
;; (setq org-agenda-files '("~/Nutstore Files/我的坚果云/org-agenda-dir/"))

(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

(global-set-key (kbd "s-/") 'hippie-expand)

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

(require 'color)
(let ((bg "#000000"))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background , (color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 50)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 20)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))


;; (require 'conda)
;; if you want interactive shell support, include:
;; (conda-env-initialize-interactive-shells)
;; if you want eshell support, include:
;; (conda-env-initialize-eshell)
;; if you want auto-activation (see below for details), include:
;; (conda-env-autoactivate-mode t)

;; (setq conda-env-home-directory "/opt/miniconda2/")

;; get current environment--from environment variable CONDA_DEFAULT_ENV
;; (conda-env-activate 'getenv "CONDA_DEFAULT_ENV")
;; (conda-env-autoactivate-mode t)
;; (setq-default mode-line-format (cons mode-line-format '(:exec conda-env-current-name)))

;;(setenv "PATH" (concat (getenv "PATH") ":/sw/bin"))
;;(setq exec-path (append exec-path '("/sw/bin")))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; (smart-mode-line-enable)
;; (smart-mode-line-powerline-theme)
;; (require 'powerline)
;; (powerline-default-theme)
;; (setq powerline-height 18)

;; (setq powerline-text-scale-factor 0.01)

(projectile-mode)
;; (setq projectile-enable-caching t)

;;; (setq display-time-format "%A %m-%d %T")
(setq display-time-format "%H:%M")
(display-time-mode)

;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(custom-safe-themes
;;   '("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
;; '(package-selected-packages
;;   '(typescript-mode elixir-mode elixir-yasnippets inf-elixir flymake-python-pyflakes highlight highlight-blocks highlight-context-line python python-mode flycheck-pycheckers flycheck-pyflakes flycheck-pyre markdown-mode flycheck web-mode js2-mode json-mode company company-box paredit clj-refactor clojure-mode cider ivy ivy-posframe rainbow-delimiters color-theme-modern helm lsp-mode lsp-ui conda restart-emacs company-lsp projectile magit neotree all-the-icons auto-complete)))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(company-scrollbar-bg ((t (:background "#7fff7fff7fff"))))
;; '(company-scrollbar-fg ((t (:background "#333333333333"))))
;; '(company-tooltip ((t (:inherit default :background "#051e051e051e"))))
;; '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
;; '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))


;;(load-theme 'doom-acario-dark t)

;; (doom-modeline-mode)

;; (custom-set-faces
;;  '(mode-line ((t (:family "Consolas" :height 0.8))))
;;  '(mode-line-inactive ((t (:family "Consolas" :height 0.8)))))

;; (setq doom-modeline-height 0)
;; (setq doom-modeline-bar-width 0)
;; (setq doom-modeline-window-width-limit fill-column)
;; (setq doom-modeline-icon (display-graphic-p))

;; (setq doom-modeline-bar-width 0)

;; built-in `project' on 26+
;; (setq doom-modeline-project-detection 'project)
;; or `find-in-project' if it's installed
;; (setq doom-modeline-project-detection 'ffip)

(defadvice projectile-project-root (around ignore-remote first activate)
  (unless (file-remote-p default-directory) ad-do-it))

