;;; package --- spipDoom
;;; Commentary:
;;; summary: private config of Doom
;;; Code:

(setq-default tab-width 2)
(setq c-basic-indent 2)
(set-frame-parameter (selected-frame) 'alpha '(100 . 90))
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(load-theme 'doom-city-lights)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(setq org-cycle-separator-lines 2)
;;(add-to-list 'load-path "~/cloud/.personal/dotfiles/emacsPackages/")
(bind-key (kbd "M-y") 'helm-show-kill-ring)

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
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(require 'doom-modeline)
(doom-modeline-mode 1)

(setq doom-modeline-height 25)
(setq doom-modeline-bar-width 3)
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
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

(setq org-agenda-files '("home/sole/cloud/.personal/agenda/"))

(use-package org-agenda
  :after org
  :bind (:map org-agenda-mode-map
          ("X" . my/org-agenda-mark-done-and-add-followup)
          ("x" . my/org-agenda-done))
  :preface
  (defun my/org-agenda-done (&optional arg)
    "Mark current TODO as done.
                              This changes the line at point, all other lines in the agenda referring to
                              the same tree node, and the headline of the tree node in the Org-mode file."
    (interactive "P")
    (org-agenda-todo "DONE"))

  (defun my/org-agenda-mark-done-and-add-followup ()
    "Mark the current TODO as done and add another task after it.
                               Creates it at the same level as the previous task, so it's better to use
                               this with to-do items than with projects or headings."
    (interactive)
    (org-agenda-todo "DONE")
    (org-agenda-switch-to)
    (org-capture 0 "t"))
  :custom
  (org-agenda-dim-blocked-tasks t)
  (org-agenda-inhibit-startup t)
  (org-agenda-show-log t)
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)
  (org-agenda-skip-scheduled-if-done nil)
  (org-agenda-span 2)
  (org-agenda-start-on-weekday 6)
  (org-agenda-sticky nil)
  (org-agenda-tags-column -100)
  (org-agenda-time-grid '((daily today require-timed)))
  (org-agenda-use-tag-inheritance t)
  (org-columns-default-format "%14SCHEDULED %Effort{:} %1PRIORITY %TODO %50ITEM %TAGS")
  (org-default-notes-file "~/cloud/.personal/agenda/organizer.org")
  (org-directory "~/cloud/.personal")
  (org-enforce-todo-dependencies t)
  (org-habit-graph-column 80)
  (org-habit-show-habits-only-for-today nil)
  (org-track-ordered-property-with-tag t))

(setq org-agenda-files (list "~/cloud/.personal/agenda"))
(setq org-refile-targets (quote (("~/cloud/.personal/notes/orgmode.org" :maxlevel . 1)
                                 (nil :maxlevel . 3)
                                 (org-agenda-files :maxlevel . 3))))
(setq org-outline-path-complete-in-steps t)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling                                    ("~/cloud/.personal/agenda" :level . 2))))

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

(use-package org-clock
  :preface
  (defun my/org-mode-ask-effort ()
    "Ask for an effort estimate when clocking in."
    (unless (org-entry-get (point) "Effort")
      (let ((effort
             (completing-read
              "Effort: "
              (org-entry-get-multivalued-property (point) "Effort"))))
        (unless (equal effort "")
          (org-set-property "Effort" effort)))))
  :hook (org-clock-in-prepare-hook . my/org-mode-ask-effort)
  :custom
  (org-clock-clocktable-default-properties
   '(:block day :maxlevel 2 :scope agenda :link t :compact t :formula %
            :step day :fileskip0 t :stepskip0 t :narrow 80
            :properties ("Effort" "CLOCKSUM" "CLOCKSUM_T" "TODO")))
  (org-clock-continuously nil)
  (org-clock-in-switch-to-state "STARTED")
  (org-clock-out-remove-zero-time-clocks t)
  (org-clock-persist t)
  (org-clock-persist-file "~/cloud/.personal/agenda/.clock")
  (org-clock-persist-query-resume nil)
  (org-clock-report-include-clocking-task t)
  (org-show-notification-handler (lambda (msg) (alert msg))))
;; global Effort estimate values
(setq org-global-properties
      '(("Effort_ALL" .
         "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")))
;; Set default column view headings: Task Priority Effort Clock_Summary
(setq org-columns-default-format "%50ITEM(Task) %2PRIORITY %10Effort(Effort){:} %10CLOCKSUM")

(with-eval-after-load "ob"
  (require 'org-babel-eval-in-repl)
  (define-key org-mode-map (kbd "C-<return>") 'ober-eval-in-repl)
  (define-key org-mode-map (kbd "M-<return>") 'ober-eval-block-in-repl))

(evil-define-key 'normal evil-org-mode-map
  "o" '(lambda () (interactive) (evil-org-eol-call 'clever-insert-item))
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
          (kbd "M-J") 'org-shiftmetadown
          (kbd "M-o") '(lambda () (interactive)
                         (evil-org-eol-call
                          '(lambda()
                             (org-insert-heading)
                             (org-metaright))))
          (kbd "M-t") '(lambda () (interactive)
                         (evil-org-eol-call
                          '(lambda()
                             (org-insert-todo-heading nil)
                             (org-metaright))))))
      '(normal insert))

      (require 'org-bullets)
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((emacs-lisp . t)
         (python . t)
         (shell . t)))
      (require 'ob-shell)
      (require 'ox-md)
      (doom-themes-org-config)
      (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

      (setq org-element-use-cache nil)
      (use-package org
        :init
        (setq org-use-speed-commands t
              org-return-follows-link t
              org-hide-emphasis-markers t
              org-completion-use-ido t
              org-agenda-files '("~/cloud/.personal/agenda")
              org-outline-path-complete-in-steps nil
              org-src-fontify-natively t   ;; Pretty code blocks
              org-src-tab-acts-natively t
              org-confirm-babel-evaluate nil
              org-books-file "~/cloud/.personal/my-list.org"
              org-hide-emphasis-markers t))
      (setq org-cycle-separator-lines 2)
 ;;     (setq ("%latex -interaction nonstopmode -output-directory %o %f" "%bib %b"
  ;;     "%latex -interaction nonstopmode -output-directory %o %f" "%latex
   ;;   -interaction nonstopmode -output-directory %o %f")
 ;;)
