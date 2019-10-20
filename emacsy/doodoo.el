(require 'printing)		; load printing package
(setq pr-path-alist
	    '((unix      "." "/bin" ghostview mpage PATH)
	      (ghostview "/usr/bin/gsview")
	      (mpage     "/usr/bin/mpage")))
(setq pr-ps-name       'lps)
(setq pr-ps-printer-alist '((lpss "lp" nil "-d" "HLL2390DW")))
(pr-update-menus t)

(bind-key (kbd "M-y") 'helm-show-kill-ring)
(bind-key (kbd "M-o") 'company-complete)

(bind-key (kbd "M-p") nil)
(bind-key (kbd "M-p l") 'org-cliplink)
(bind-key (kbd "M-p v") 'org-brain-visualize)
(bind-key (kbd "M-p a") '+popup/raise)
(bind-key (kbd "M-p c") 'org-id-get-create)
(bind-key (kbd "M-p r") 'slime-repl)

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
  :bind (("C-c l" . 'counsel-rg)
         ("C-c r" . 'counsel-projectile-rg))
  :config
  (rg-enable-default-bindings))

(use-package doom-modeline)
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

(require 'org-tempo)
(setq tempo-interactive t)
(tempo-define-template "my-property"
                       '(":PROPERTIES:" p ":END:" >)
                       "<p"
                       "Insert a property tempate")
(tempo-define-template "name"
                       '("#+NAME:" (p "Name : " name)  >)
                       "<n"
                       "Insert name")
(tempo-define-template "attr-org"
                       '("#+ATTR_ORG: :width 400")
                       "<o")

(setq reftex-default-bibliography '("~/.personal/.bibstuff/master-biblio.bib"))

(setq org-ref-bibliography-notes "~/.personal/.bibstuff/orgRefNotes.org"
      org-ref-default-bibliography '("~/.personal/.bibstuff/master-bib.bib")
      org-ref-pdf-directory "~/.personal/.bibstuff/bib-pdfs/")

(setq bibtex-completion-bibliography '("~/.personal/.bibstuff/master-bib.bib")
      bibtex-completion-library-path "~/.personal/.bibstuff/bib-pdfs/"
      bibtex-completion-notes-path "~/.personal/.bibstuff/helm-bibtex-notes")

(setq bibtex-completion-pdf-field "file")
(setq bibtex-completion-pdf-open-function
      (lambda (fpath)
        (start-process "evince" "*helm-bibtex-evince*" "/usr/bin/evince"
                       fpath)))

(setq bibtex-dialect 'biblatex)

(setq bibtex-completion-format-citation-functions
      '((org-mode . bibtex-completion-format-citation-ebib)
        (latex-mode    . bibtex-completion-format-citation-cite)
        (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
        (default       . bibtex-completion-format-citation-default)))

(setq bibtex-completion-display-formats
      '((article       . "${author:36} ${title:*} ${journal:40} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")
        (inbook        . "${author:36} ${title:*} Chapter ${chapter:32} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")
        (incollection  . "${author:36} ${title:*} ${booktitle:40} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")
        (inproceedings . "${author:36} ${title:*} ${booktitle:40} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")
        (t             . "${author:36} ${title:*} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")))

(run-with-idle-timer 20 t 'evil-normal-state)

(setq-default
 evil-escape-key-sequence "jk"
 evil-escape-unordered-key-sequence "true")

(evil-define-key nil evil-insert-state-map
  "\C-f" 'evil-forward-char
  "\C-b" 'evil-backward-char
  "\C-k" 'kill-line
  "\C-y" 'evil-paste-after)

(require 'engine-mode)
(engine-mode t)

(defengine wolfram-alpha
  "http://www.wolframalpha.com/input/?i=%s")

(defengine libgen-articles
  "http://gen.lib.rus.ec/scimag/?q=%s")

(defengine libgen-books
  "http://gen.lib.rus.ec/search.php?req=%s")

(defengine wiktionary
  "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s"
  :keybinding "p")

(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
  :keybinding "y")

(defengine goodreads
  "https://www.goodreads.com/search?q=%s"
  :keybinding "r")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w"
  :docstring "Searchin' the wikis.")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  :keybinding "s")

(defengine amazon
  "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s"
  :keybinding "a")

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "h")

(defengine google-maps
  "http://maps.google.com/maps?q=%s"
  :docstring "Mappin' it up."
  :keybinding "m")

(defengine project-gutenberg
  "http://www.gutenberg.org/ebooks/search/?query=%s")

(defengine rfcs
  "http://pretty-rfc.herokuapp.com/search?q=%s")

(defengine twitter
  "https://twitter.com/search?q=%s")

(setq slime-contribs '(slime-fancy slime-asdf))
(setq inferior-lisp-program "sbcl --dynamic-space-size 10000")
(setq inferior-julia-program-name "/usr/bin/julia")
(setq python-python-command "/usr/bin/ipython")

(setq erlang-root-dir "/usr/lib/erlang")
(add-to-list 'load-path "/usr/lib/erlang/lib/tools-3.2.1/emacs")
(add-to-list 'load-path "~/dotfiles/emacsy/packages/stable-packages/ob-erlang")
(add-to-list 'exec-path "/usr/lib/erlang/bin")
(require 'erlang-start)
(require 'ob-erlang)

(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(require 'lsp)
(require 'lsp-haskell)
(require 'lsp-ui)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(add-to-list 'load-path
             "/home/sole/.opam/default/share/emacs/site-lisp/")
(require 'ocp-indent)
(setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (ocaml . t)
   (julia . t)
   (racket . t)
   (lisp . t)
   (shell . t)
   (erlang . t)
   (js . t)
   (C . t)
   (haskell . t)
   (makefile .t)
   (scheme . t)
   (ditaa .t)))

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
;; Log the time when a TODO item was finished
(setq org-log-done 'time)

;; Specify global tags with fast tag selection
(setq org-tag-alist '((:startgroup . nil) ("@office" . ?o) ("@home" . ?h) (:endgroup . nil)
                      ("computer" . ?c) ("reading" . ?r)
                      ("grocery" . ?g) ("homework" . ?w) ("research" . ?r)))

;; Effort and global properties
(setq org-global-properties '(("Effort_ALL". "0 0:10 0:20 0:30 1:00 1:30 2:00 3:00 4:00 6:00 8:00")))

;; Set global Column View format
(setq org-columns-default-format '"%38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM(Clock)")

(require 'org-wiki)
(setq org-wiki-location-list
      '( "~/.personal/org/" "~/meta-wiki/mywiki/" "~/meta-wiki/blog" "~/dotfiles/"
         "~/meta-wiki/demos"))
(setq org-wiki-location (car org-wiki-location-list))

(setq org-wiki-template
      (string-trim
       "
#+TITLE: %n
#+AUTHOR: Frederic Boileau
#+email:frederic.boileau@protonmail.com
#+DESCRIPTION:
#+KEYWORDS:
#+DATE: %d

#+STARTUP:  inlineimages lognoteclock-out hideblocks
#+PROPERTY: ATTACH_DIR .
#+STARTUP:  content
#+ATTR_ORG: :width 200/250/300/400/500/600
#+TODO: fixme(r) todo(t) inprog(p) stable(d) idea(i) wait(w) | broken(b)

- [[wiki:index][Index]]

- Related:

* %n "))

(use-package org-brain
  :init
  (setq org-brain-path "~/.personal/org/brain")
  ;; For Evil users
  (with-eval-after-load 'evil
    (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
  :config
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.personal/org/.org-id-locations")
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all))

(defun org-brain-cliplink-resource ()
  "Add a URL from the clipboard as an org-brain resource.
Suggest the URL title as a description for resource."
  (interactive)
  (let ((url (org-cliplink-clipboard-content)))
    (org-brain-add-resource
     url
     (org-cliplink-retrieve-title-synchronously url)
     t)))

(define-key org-brain-visualize-mode-map (kbd "L") #'org-brain-cliplink-resource)

(defun org-brain-insert-resource-icon (link)
  "Insert an icon, based on content of org-mode LINK."
  (insert (format "%s "
                  (cond ((string-prefix-p "http" link)
                         (cond ((string-match "wikipedia\\.org" link)
                                (all-the-icons-faicon "wikipedia-w"))
                               ((string-match "github\\.com" link)
                                (all-the-icons-octicon "mark-github"))
                               ((string-match "vimeo\\.com" link)
                                (all-the-icons-faicon "vimeo"))
                               ((string-match "youtube\\.com" link)
                                (all-the-icons-faicon "youtube"))
                               (t
                                (all-the-icons-faicon "globe"))))
                        ((string-prefix-p "brain:" link)
                         (all-the-icons-fileicon "brain"))
                        (t
                         (all-the-icons-icon-for-file link))))))

(add-hook 'org-brain-after-resource-button-functions #'org-brain-insert-resource-icon)

(defface aa2u-face '((t . nil))
  "Face for aa2u box drawing characters")
(advice-add #'aa2u-1c :filter-return
            (lambda (str) (propertize str 'face 'aa2u-face)))
(defun aa2u-org-brain-buffer ()
  (let ((inhibit-read-only t))
    (make-local-variable 'face-remapping-alist)
    (add-to-list 'face-remapping-alist
                 '(aa2u-face . org-brain-wires))
    (ignore-errors (aa2u (point-min) (point-max)))))
(with-eval-after-load 'org-brain
  (add-hook 'org-brain-after-visualize-hook #'aa2u-org-brain-buffer))

(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.personal/org/todo.org" "tasks")
         "* TODO %?\n:PROPERTIES:\n:Created: %U\n:Linked: %A\n:END:\n %i"
         :prepend t)

        ("s" "Started" entry (file+headline "~/.personal/org/todo.org" "tasks")
         "* STARTED %?\n %i" :clock-in t :clock-keep t :prepend t)

        ("j" "Journal" entry (file+olp+datetree "~/.personal/org/journal.org")
         "* %?\nEntered on %U\n %i\n %a")

        ("b" "Books" entry (file+headline "~/notes/books.org" "Books")
         "* %(read-string \"Title: \")\n
          :PROPERTIES: Pages: %(number-to-string (read-number \"Pages:\")):END:\n
          Author: %(read-string \"Author: \")\n")

        ("w" "Web site" entry
         (file "")
         "* %a :website:\n\n%U %?\n\n%:initial")

        ("c" "Contact" entry (file+headline "~/.personal/org/contacts.org" "Friends")
         "* %(read-string \"Name: \")\n
          :PROPERTIES:\n
          :EMAIL: %(read-string \"emacs: \")\n
          :END:")

        ("Q" "quote org capture" entry
         (file+headline ,"~/meta-wiki/mywiki/inbox.org" "browsing")
         "* %?%:description Added %U
#+BEGIN_QUOTE
%x
#+END_QUOTE" :immediate-finish t)))

;; [[file:~/dotfiles/emacsy/doodoo.org::*org publish project alist][org publish project alist:1]]
(require 'ox-html)
(require 'ox-publish)

(setq org-publish-project-alist
      '(("blog-org"
         :base-directory "~/meta-wiki/blog"
         :base-extension "org"
         :publishing-directory "~/meta-wiki/blog/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t)

        ("blog-static"
         :base-directory "~/meta-wiki/blog/static/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/meta-wiki/blog/public_html/"
         :recursive t
         :publishing-function org-publish-attachment)

        ("blog" :components ("blog-org" "blog-static"))

        ("demos-org"
         :base-directory "~/meta-wiki/demos/"
         :base-extension "org"
         :publishing-directory "~/meta-wiki/demos/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t)

        ("demos-static"
         :base-directory "~/meta-wiki/demos/static/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/meta-wiki/demos/public_html/"
         :recursive t
         :publishing-function org-publish-attachment)

        ("demos" :components ("demos-org" "demos-static"))))
;; org publish project alist:1 ends here

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

(use-package company
  :init
  (setq company-tooltip-align-annotations t)
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .2)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))
(define-key global-map (kbd "C-.") 'company-files)

(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

(require 'mu4e-contrib)
(setq mu4e-html2text-command 'mu4e-shr2text)
(setq shr-color-visible-luminance-min 60)
(setq shr-color-visible-distance-min 5)
(setq shr-use-colors nil)
(advice-add #'shr-colorize-region :around (defun shr-no-colourise-region (&rest ignore)))

(set-default-font "Iosevka Nerd Font 12")

(set-face-attribute 'default nil :family "Iosevka Nerd Font" :height 130)
(set-face-attribute 'fixed-pitch nil :family "Iosevka Nerd Font")
(set-face-attribute 'variable-pitch nil :family "EtBembo")


(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(set-frame-parameter (selected-frame) 'alpha '(99 . 87))
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq-default tab-width 2)
(setq c-basic-indent 2)
(setq artist-aspect-ratio 2.0)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(load "~/dotfiles/emacsy/packages/my-doom-themes-ext-org.el")
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(doom-themes-org-config)

(require 'ob-shell)
(require 'ox-md)
(require 'julia-repl)
(add-hook 'julia-mode-hook 'julia-repl-mode)
(with-eval-after-load "ob"
  (require 'org-babel-eval-in-repl))
(require 'eval-in-repl)

(setq org-directory "~/.personal/org")
(setq org-agenda-files '("~/.personal/org"))
(setq org-modules '(org-wikinodes org-w3m org-bbdb org-bibtex
                                  org-docview org-gnus org-info org-irc org-mhe org-rmail org-eww))

(setq org-attach-dir-relative t)
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))

(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ;

(setq org-babel-lisp-eval-fn 'sly-eval)
(setq org-cycle-separator-lines 2)


(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-mode)
  (warn "toc-org not found"))

(setq org-blank-before-new-entry '((heading . auto) (plain-list-item . auto)))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-latex-pdf-process
      (list "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f %f"))

(use-package evil-org
  :commands evil-org-mode
  :after org
  :init
  (add-hook 'org-mode-hook 'evil-org-mode)
  :config

  (evil-define-key 'normal evil-org-mode-map
    "<" 'org-metaleft
    ">" 'org-metaright
    "-" 'org-cycle-list-bullet
    (kbd "TAB") 'org-cycle)
  ;; normal & insert state shortcuts.
  (mapc (lambda (state)
          (evil-define-key state evil-org-mode-map
            (kbd "C-;") 'ober-eval-block-in-repl
            (kbd "M-;") 'ober-eval-in-repl
            (kbd "M-l") 'org-metaright
            (kbd "M-h") 'org-metaleft
            (kbd "M-k") 'org-metaup
            (kbd "M-j") 'org-metadown
            (kbd "M-L") 'org-shiftmetaright
            (kbd "M-H") 'org-shiftmetaleft
            (kbd "M-K") 'org-shiftmetaup
            (kbd "M-J") 'org-shiftmetadown))
        '('normal 'insert)))

(add-to-list 'load-path "~/dotfiles/emacsy/packages/yasnippet/")
(require 'yasnippet)
(use-package yasnippet-snippets)
(use-package helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(setq yas-snippet-dirs
      '("~/dotfiles/emacsy/mysnippets/"))
(yas-global-mode 1)

(setq epg-gpg-program "gpg")
(require 'epa-file)
(epa-file-enable)
(setq auth-sources "~/.authinfo.gpg")
(setq auth-source-debug t)
(setf epa-pinentry-mode 'loopback)
(require 'mu4e)
(require 'smtpmail)

;; make sure mu4e is in your load-path
;; use mu4e for e-mail in emacs
(setq mail-user-agent 'mu4e-user-agent)
(setq mu4e-get-mail-command "offlineimap"
      mu4e-update-interval 300)

(setq mu4e-mu-home "/home/sole/.mail/outlook/udem")
(setq mu4e-maildir            "/home/sole/.mail/outlook/udem"
      mu4e-sent-folder        "/Sent"
      mu4e-drafts-folder      "/Drafts"
      mu4e-trash-folder       "/Trash"
      mu4e-refile-folder      "/Archive")

(setq mu4e-user-mail-address-list '("frederic.boileau@umontreal.ca"))
(setq mu4e-compose-reply-to-address "frederic.boileau@umontreal.ca"
      user-mail-address "frederic.boileau@umontreal.ca"
      user-full-name  "Frederic Boileau")

(setq mu4e-compose-signature
      "\n\n---frederic Boileau")

;; (setq user-mail-address "frederic.boileau@protonmail.com"
;;       user-full-name "Frederic Boileau")

(setq gnus-select-method '(nnimap "localhost"
                                  (nnimap-stream plain)
                                  (nnimap-address "127.0.0.1")
                                  (nnimap-server-port 1143)))

(setq smtpmail-default-smtp-server "127.0.0.1")
(setq mail-sources '((imap :server "127.0.0.1"
                           :user "frederic.boileau@protonmail.com"
                           :password "Um1T9PLwooU0r-jWkONqzQ")))
(require 'starttls)

(setq send-mail-function         'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server       "127.0.0.1"
      smtpmail-smtp-service 1025
      smtpmail-debug-info t
      smtpmail-debug-verb t
      starttls-extra-arguments nil
      starttls-gnutls-program "/usr/bin/gnutls-cli"
      starttls-extra-arguments nil
      starttls-use-gnutls t
      smtpmail-auth-credentials "~/.authinfo.gpg")
(setq starttls-extra-arguments nil)

(require 'gnus-desktop-notify)
(gnus-desktop-notify-mode)
(gnus-demon-add-scanmail)
(load-library "smtpmail")
;; smtp mail setting
