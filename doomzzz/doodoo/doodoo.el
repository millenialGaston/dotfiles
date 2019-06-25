;;; package --- doodoo
;;; Commentary:
;;; summary: private config of Doom
;;; Code:

(setq org-cycle-separator-lines 2)
(require 'doom-themes)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(doom-themes-org-config)
(setq-default tab-width 2)
(setq c-basic-indent 2)
(set-frame-parameter (selected-frame) 'alpha '(100 . 90))
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(setq org-cycle-separator-lines 2)
(bind-key (kbd "M-y") 'helm-show-kill-ring)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "brave")

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c f") 'counsel-fzf)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)

(use-package rg
  :bind ("C-c l" . counsel-rg)
  :config
  (rg-enable-default-bindings))

(require 'doom-modeline)
(doom-modeline-mode 1)

(setq doom-modeline-height 25)
(setq doom-modeline-bar-width 3)
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-persp-name t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-enable-word-count nil)
(setq doom-modeline-buffer-encoding t)
(setq doom-modeline-indent-info nil)
(setq doom-modeline-checker-simple-format t)
(setq doom-modeline-vcs-max-length 12)
(setq doom-modeline-persp-name t)
(setq doom-modeline-lsp t)
(setq doom-modeline-github nil)
(setq doom-modeline-github-interval (* 30 60))
(setq doom-modeline-env-version t)
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-ruby t)
(setq doom-modeline-env-enable-perl t)
(setq doom-modeline-env-enable-go t)
(setq doom-modeline-env-enable-elixir t)
(setq doom-modeline-env-enable-rust t)

;; Change the executables to use for the language version string
(setq doom-modeline-env-python-executable "python")
(setq doom-modeline-env-ruby-executable "ruby")
(setq doom-modeline-env-perl-executable "perl")
(setq doom-modeline-env-go-executable "go")
(setq doom-modeline-env-elixir-executable "iex")
(setq doom-modeline-env-rust-executable "rustc")
(setq doom-modeline-mu4e t)
(setq doom-modeline-irc t)
(setq doom-modeline-irc-stylize 'identity)

(require 'ob-shell)
(require 'ox-md)
(with-eval-after-load "ob"
  (require 'org-babel-eval-in-repl))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (shell . t)))

(use-package org-faces
  :after org
  :custom
  (org-todo-keyword-faces
   '(("DONE" . (:foreground "cyan" :weight bold))
     ("SOMEDAY" . (:foreground "gray" :weight bold))
     ("WAITING" . (:foreground "red" :weight bold))
     ("STARTED" . (:foreground "cyan" :weight normal))
     ("NEXT" . (:foreground "cyan" :weight bold)))))

      (let* ((variable-tuple (cond ((x-list-fonts   "Source Sans Pro") '(:font   "Source Sans Pro"))
                                   ((x-list-fonts   "Lucida Grande")   '(:font   "Lucida Grande"))
                                   ((x-list-fonts   "Verdana")         '(:font   "Verdana"))
                                   ((x-family-fonts "Sans Serif")      '(:family "Sans Serif"))
                                   (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro.")))) (base-font-color (face-foreground 'default nil 'default))
                                   (headline       `(:inherit default :weight normal :foreground ,base-font-color)))

        (custom-theme-set-faces
         'user
         `(org-level-8        ((t (,@headline ,@variable-tuple))))
         `(org-level-7        ((t (,@headline ,@variable-tuple))))
         `(org-level-6        ((t (,@headline ,@variable-tuple))))
         `(org-level-5        ((t (,@headline ,@variable-tuple))))
         `(org-level-4        ((t (,@headline ,@variable-tuple :height 1.1))))
         `(org-level-3        ((t (,@headline ,@variable-tuple :height 1.25))))
         `(org-level-2        ((t (,@headline ,@variable-tuple :height 1.5))))
         `(org-level-1        ((t (,@headline ,@variable-tuple :height 1.70))))
         `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(setq reftex-default-bibliography '("~/cloud/.bibstuff/references.bib"))

(setq org-ref-bibliography-notes "~/cloud/.bibstuff/orgRefNotes.org"
      org-ref-default-bibliography '("~/cloud/.bibstuff/references.bib")
      org-ref-pdf-directory "~/cloud/zotf_ile")

(setq bibtex-completion-bibliography '("~/cloud/.bibstuff/references.bib")
      bibtex-completion-library-path "~/cloud/zotf_ile"
      bibtex-completion-notes-path "~/cloud/.bibstuff/helm-bibtex-notes")

(setq bibtex-completion-pdf-field "file")
(setq bibtex-completion-pdf-open-function
      (lambda (fpath)
        (start-process "evince" "*helm-bibtex-evince*" "/usr/bin/evince"
                       fpath)))
(setq bibtex-dialect 'biblatex)

(setq bibtex-completion-format-citation-functions
      '((org-mode      . bibtex-completion-format-citation-org-link-to-PDF)
        (latex-mode    . bibtex-completion-format-citation-cite)
        (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
        (default       . bibtex-completion-format-citation-default)))
