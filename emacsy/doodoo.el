;; Set default font
(add-to-list 'load-path
              "~/dotfiles/emacsy/packages/yasnippet/")
(require 'yasnippet)
(yas-global-mode 1)

(use-package doom-snippets
  :load-path "~/dotfiles/emacsy/packages/doom-snippets"
  :after yasnippet)

(global-set-key (kbd "M-p l") 'org-cliplink)
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 120
                    :weight 'normal
                    :width 'normal)
(setq  inferior-julia-program-name "/usr/bin/julia")
(setq python-python-command "/usr/bin/ipython")
(ranger-override-dired-mode t)
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
(bind-key (kbd "M-o") 'company-complete)
(global-set-key (kbd "M-p") nil)
(bind-key (kbd "M-p l") 'org-cliplink)
(load-theme 'doom-city-lights)

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
(require 'org-tempo)
(setq tempo-interactive t)
(require 'ox-md)
(require 'julia-repl)
(add-hook 'julia-mode-hook 'julia-repl-mode)
(with-eval-after-load "ob"
  (require 'org-babel-eval-in-repl))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (julia . t)
   (shell . t)))

(tempo-define-template "my-property"
                       '(":PROPERTIES:" p ":END:" >)
                       "<p"
                       "Insert a property tempate")
(tempo-define-template "name"
                       '("#+NAME:" (p "Name : " name)  n)
                       "<n"
                       "Insert name")

(setq reftex-default-bibliography '("~/.personal/.bibstuff/master-biblio.bib"))

(setq org-ref-bibliography-notes "~/.personal/.bibstuff/orgRefNotes.org"
      org-ref-default-bibliography '("~/.personal/.bibstuff/master-bib.bib")
      org-ref-pdf-directory "~/.personal/zotero/storage/")

(setq bibtex-completion-bibliography '("~/.personal/.bibstuff/master-bib.bib")
      bibtex-completion-library-path "~/.personal/zotero/storage"
      bibtex-completion-notes-path "~/.personal/.bibstuff/helm-bibtex-notes")

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

(evil-define-key nil evil-insert-state-map
  "\C-n" 'evil-next-visual-line
  "\C-p" 'evil-previous-visual-line
  "\C-f" 'evil-forward-char
  "\C-b" 'evil-backward-char
  "\C-k" 'kill-line)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-directory "~/.personal/org")
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'tree))

(setq org-todo-keywords
      '(
        (sequence "IDEA(i)" "TODO(t)" "STARTED(s)" "NEXT(n)" "WAITING(w)"
                  "PROJECT" "|" "DONE(d)" "ABRT(a)")
        (sequence "|" "CANCELED(c)"
                  "DELEGATED(l)" "SOMEDAY(f)")))

(setq org-todo-keyword-faces
      '(("IDEA" . (:foreground "GoldenRod" :weight bold))
        ("CANCELED" . (:foreground "LimeGreen" :weight bold))
        ("DELEGATED" . (:foreground "LimeGreen" :weight bold))
        ("SOMEDAY" . (:foreground "LimeGreen" :weight bold))))

(setq org-tag-persistent-alist
      '((:startgroup . nil)
        ("HOME" . ?h)
        ("RESEARCH" . ?r)
        ("TEACHING" . ?t)
        (:endgroup . nil)
        (:startgroup . nil)
        ("OS" . ?o)
        ("DEV" . ?d)
        ("GEEK" ?g)
        ("WWW" . ?w)
        (:endgroup . nil)
        (:startgroup . nil)
        ("EASY" . ?e)
        ("MEDIUM" . ?m)
        ("HARD" . ?a)
        (:endgroup . nil)
        ("URGENT" . ?u)
        ("KEY" . ?k)
        ("BONUS" . ?b)
        ("noexport" . ?x)))

(setq org-tag-faces
      '(("HOME" . (:foreground "GoldenRod" :weight bold))
        ("RESEARCH" . (:foreground "GoldenRod" :weight bold))
        ("TEACHING" . (:foreground "GoldenRod" :weight bold))
        ("OS" . (:foreground "IndianRed1" :weight bold))
        ("DEV" . (:foreground "IndianRed1" :weight bold))
        ("WWW" . (:foreground "IndianRed1" :weight bold))
        ("URGENT" . (:foreground "Red" :weight bold))
        ("KEY" . (:foreground "Red" :weight bold))
        ("EASY" . (:foreground "OrangeRed" :weight bold))
        ("MEDIUM" . (:foreground "OrangeRed" :weight bold))
        ("HARD" . (:foreground "OrangeRed" :weight bold))
        ("BONUS" . (:foreground "GoldenRod" :weight bold))
        ("noexport" . (:foreground "LimeGreen" :weight bold))))

(defvar yt-iframe-format
  ;; You may want to change your width and height.
  (concat "<iframe width=\"440\""
          " height=\"335\""
          " src=\"https://www.youtube.com/embed/%s\""
          " frameborder=\"0\""
          " allowfullscreen>%s</iframe>"))

(org-add-link-type
 "yt"
 (lambda (handle)
   (browse-url
    (concat "https://www.youtube.com/embed/"
            handle)))
 (lambda (path desc backend)
   (cl-case backend
     (html (format yt-iframe-format
                   path (or desc "")))
     (latex (format "\href{%s}{%s}"
                    path (or desc "video"))))))

(use-package evil-org
  :commands evil-org-mode
  :after org
  :init
  (add-hook 'org-mode-hook 'evil-org-mode))

(evil-define-key 'normal evil-org-mode-map
  "<" 'org-metaleft
  ">" 'org-metaright
  "-" 'org-cycle-list-bullet
  (kbd "TAB") 'org-cycle)
;; normal & insert state shortcuts.
(mapc (lambda (state)
        (evil-define-key state evil-org-mode-map
          (kbd "M-l") 'org-metaright
          (kbd "M-h") 'org-metaleft
          (kbd "M-k") 'org-metaup
          (kbd "M-j") 'org-metadown
          (kbd "M-L") 'org-shiftmetaright
          (kbd "M-H") 'org-shiftmetaleft
          (kbd "M-K") 'org-shiftmetaup
          (kbd "M-J") 'org-shiftmetadown))
      '(normal insert))
