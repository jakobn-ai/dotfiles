;;; packages --- Summary
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(package-selected-packages
   '(; Languages
     auctex elpy flymake-shellcheck go-mode graphviz-dot-mode lean-mode rust-mode yaml-mode
     ; Workflow
     evil flycheck helm hl-todo lsp-mode magit org-chef pdf-tools ranger vterm)))

;;; Commentary:
; trying to keep it at least a bit minimalistic

;;; Code:
(server-start)
; Settings
(setq
 backup-directory-alist '(("." . "~/.cache/emacs"))
 compilation-scroll-output t
 display-line-numbers-type 'relative
 evil-want-C-i-jump nil
 graphviz-dot-preview-extension "pdf"
 initial-major-mode 'text-mode
 mouse-yank-at-point t
 org-agenda-files '("~/Documents/orgzly")
 org-agenda-file-regexp "\\`.*todo\\.org\\'"
 org-agenda-show-future-repeats 'next
 org-agenda-start-on-weekday nil
 org-agenda-todo-ignore-scheduled 'all
 org-agenda-todo-ignore-deadlines 'all
 org-enforce-todo-dependencies t
 org-latex-preview-ltxpng-directory "~/.cache/emacs/ltximg"
 org-log-repeat nil
 org-tags-column 0
 scroll-conservatively 30
 scroll-margin 4
 scroll-step 1
 visible-bell t
 vc-follow-symlinks t
 LilyPond-pdf-command "emacsclient"
)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c a") #'org-agenda)
(add-hook 'org-mode-hook (lambda () (plist-put org-format-latex-options :scale 2)))
(put 'magit-clean 'disabled nil)

; Modes
(column-number-mode)
(electric-pair-mode)
(evil-mode)
(global-display-line-numbers-mode)
(global-flycheck-mode)
(global-hl-todo-mode)
(global-visual-line-mode)
(helm-mode)
(icomplete-mode)
(ranger-override-dired-mode)
(savehist-mode)
(show-paren-mode)
(tab-bar-mode)
(winner-mode)

; Graphical mode fixes (does not apply to emacs-nox)
(blink-cursor-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

; Styling (dto. emacs-nox)
(dolist (p '(
             (font . "IBM Plex Mono-10")
             (fullscreen . maximized)
            ))
  (add-to-list 'default-frame-alist p))
      
(load-theme 'wombat)
(set-cursor-color "#ffffff")

; Evil, line number, and window exclusions
(dolist (m '(
             buffer-menu-mode
             compilation-mode
             image-mode
             image-dired-thumbnail-mode
             Info-mode
             TeX-output-mode
             xref--xref-buffer-mode
             vterm-mode
            ))
  (evil-set-initial-state m 'emacs))
(dolist (m '(
             compilation-mode-hook
             eshell-mode-hook
             gdb-mode-hook
             inferior-python-mode-hook
             org-agenda-mode-hook
             pdf-view-mode-hook
             TeX-output-mode-hook
             vterm-mode-hook
             ))
  (add-hook m (lambda () (display-line-numbers-mode 0))))
(dolist (b '(
             "*compilation*"
             "*grep*"
             "*xref*"
             "*Help*"
             "*Lean Goal*"
             "*Python*"
            ))
  (add-to-list 'same-window-buffer-names b))
(dolist (r '(
             "magit: .+"
             ".+\\.pdf"
             ".+\\.el\\(\\.gz\\)?"
            ))
  (add-to-list 'same-window-regexps r))

; LSP & language launchers
(dolist (m '(
             c-mode-hook
             c++-mode-hook
             go-mode-hook
             rust-mode-hook
             perl-mode-hook
             python-mode-hook
             sh-mode-hook
             ))
  (add-hook m 'lsp-deferred))
(add-hook 'lsp-mode-hook (lambda () (define-key lsp-mode-map (kbd "M-o") lsp-command-map)))
(add-hook 'lean-mode-hook (lambda () (set-input-method 'Lean)))
(add-hook 'python-mode-hook 'elpy-enable)

; No tabs
(add-hook 'rust-mode-hook (lambda () (setq indent-tabs-mode nil)))

; PDF
(pdf-tools-install)
(setq TeX-view-program-selection '((output-pdf "PDF Tools")))
(add-hook 'TeX-after-compilation-finished-functions 'TeX-revert-document-buffer)
(add-hook 'TeX-mode-hook (lambda () (setq TeX-command-default "latexmk")))
(dolist (f '(
             (lambda () (push '("latexmk" "latexmk" TeX-run-TeX nil t) TeX-command-list))
             turn-on-reftex
            ))
  (add-hook 'LaTeX-mode-hook f))

(load "~/.config/emacs/snippets/ol-textedit")
(require 'ol-textedit)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'init)
;;; init.el ends here
