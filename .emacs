; packages
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;;; gruvbox theme
(load-theme 'gruvbox-dark-medium t)

;;; ido mode - smart completion
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1) ;; ido-completing-read+ - enable IDO wherever possible

;;; smex - ido completion for M-x commands
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; magit
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;;; paredit
(defun turn-on-paredit()
  (interactive)
  (paredit-mode 1))

(add-hook 'emacs-lisp-mode-hook 'turn-on-paredit)


; end of packages


; UI configs
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)
(set-face-attribute 'default nil :height 180) ;; 18px default font size

; set separate file for emacs customizations
(setq custom-file "~/.emacs.custom.el")
(load custom-file)
