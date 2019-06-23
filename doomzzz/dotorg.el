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

      (use-package org-faces
        :after org
        :custom
        (org-todo-keyword-faces
         '(("DONE" . (:foreground "cyan" :weight bold))
           ("SOMEDAY" . (:foreground "gray" :weight bold))
           ("TODO" . (:foreground "green" :weight bold))
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

      (use-package org-mru-clock
        :bind* (("C-c C-x i" . org-mru-clock-in)
                ("C-c C-x C-j" . org-mru-clock-select-recent-task))
        :init
        (setq org-mru-clock-how-many 100
              org-mru-clock-completing-read #'ivy-completing-read))
      (setq org-clock-history-length 23)
      (defun eos/org-clock-in ()
        (interactive)
        (org-clock-in '(4)))
      (global-set-key (kbd "C-c I") #'eos/org-clock-in)
      (global-set-key (kbd "C-c O") #'org-clock-out)
      (org-clock-persistence-insinuate)
      (setq org-clock-persist t)
      (setq org-clock-in-resume t)
      (setq org-clock-persist-query-resume nil)
      (defun meeting-notes ()
        (interactive)
        (outline-mark-subtree)                              ;; Select org-mode section
        (narrow-to-region (region-beginning) (region-end))  ;; Only show that region
        (deactivate-mark)
        (delete-other-windows)                              ;; Get rid of other windows
        (text-scale-set 2)                                  ;; Text is now readable by others
        (fringe-mode 0)
        (message "When finished taking your notes, run meeting-done."))
      (defun meeting-done ()
        (interactive)
        (widen)                                       ;; Opposite of narrow-to-region
        (text-scale-set 0)                            ;; Reset the font size increase
        (fringe-mode 1)
        (winner-undo))
      (defun org-archive-done-tasks ()
        (interactive)
        (org-map-entries
         (lambda ()
           (org-archive-subtree)
           (setq org-map-continue-from (outline-previous-heading)))
         "/DONE" 'agenda))

      (let* ((variable-tuple
              (cond ((x-list-fonts   "Source Sans Pro") '(:font   "Source Sans Pro"))
                    ((x-list-fonts   "Lucida Grande")   '(:font   "Lucida Grande"))
                    ((x-list-fonts   "Verdana")         '(:font   "Verdana"))
                    ((x-family-fonts "Sans Serif")      '(:family "Sans Serif"))
                    (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
             (base-font-color (face-foreground 'default nil 'default))
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
      (defun custom-org-cliplink ()
        (interactive)
        (org-cliplink-insert-transformed-title
         (org-cliplink-clipboard-content)     ;take the URL from the CLIPBOARD
         (lambda (url title)
           (let* ((parsed-url (url-generic-parse-url url)) ;parse the url
                  (clean-title
                   (cond
                    ;; if the host is github.com, cleanup the title
                    ((string= (url-host parsed-url) "github.com")
                     (replace-regexp-in-string "GitHub - .*: \\(.*\\)" "\\1" title))
                    ;; otherwise keep the original title
                    (t title))))
             ;; forward the title to the default org-cliplink transformer
             (org-cliplink-org-mode-link-transformer url clean-title)))))

      (add-hook 'org-load-hook
                (lambda ()
                  (define-key org-mode-map "\M-n" 'org-next-link)
                  (define-key org-mode-map "\M-p" 'org-previous-link)))

     (add-to-list 'org-export-filter-timestamp-functions
                  #'endless/filter-timestamp)
     (defun endless/filter-timestamp (trans back _comm)
       "Remove <> around time-stamps."
       (pcase back
         ((or `jekyll `html)
          (replace-regexp-in-string "&[lg]t;" "" trans))
         (`latex
          (replace-regexp-in-string "[<>]" "" trans))))

     (setq-default org-display-custom-times t)
     ;;; Before you ask: No, removing the <> here doesn't work.
     (setq org-time-stamp-custom-formats
           '("<%d %b %Y>" . "<%d/%m/%y %a %H:%M>"))

     (defun org-archive-done-tasks ()
       (interactive)
       (org-map-entries
        (lambda ()
          (org-archive-subtree)
          (setq org-map-continue-from (outline-previous-heading)))
        "/DONE" 'agenda))


     (defun custom-org-cliplink ()
       (interactive)
       (org-cliplink-insert-transformed-title
        (org-cliplink-clipboard-content)     ;take the URL from the CLIPBOARD
        (lambda (url title)
          (let* ((parsed-url (url-generic-parse-url url)) ;parse the url
                 (clean-title
                  (cond
                   ;; if the host is github.com, cleanup the title
                   ((string= (url-host parsed-url) "github.com")
                    (replace-regexp-in-string "GitHub - .*: \\(.*\\)" "\\1" title))
                   ;; otherwise keep the original title
                   (t title))))
            ;; forward the title to the default org-cliplink transformer
            (org-cliplink-org-mode-link-transformer url clean-title)))))

     ;; private interactive functions
     (defun occur-non-ascii ()
       "Find any non-ascii characters in the current buffer."
       (interactive)
       (occur "[^[:ascii:]]"))
     (defun find-first-non-ascii-char ()
       "Find the first non-ascii character from point onwards."
       (interactive)
       (let (point)
         (save-excursion
           (setq point
                 (catch 'non-ascii
                   (while (not (eobp))
                     (or (eq (char-charset (following-char))
                             'ascii)
                         (throw 'non-ascii (point)))
                     (forward-char 1)))))
         (if point
             (goto-char point)
           (message "No non-ascii characters."))))
     (defun toggle-maximize-buffer () "Maximize buffer" (interactive) (if (= 1 (length (window-list)))
                                                                          (jump-to-register '_)
                                                                        (progn
                                                                          (window-configuration-to-register '_)
                                                                          (delete-other-windows))))
     (defun my-expand-file-name-at-point ()
       "Use hippie-expand to expand the filename"
       (interactive)
       (let ((hippie-expand-try-functions-list
              '(try-complete-file-name-partially
                try-complete-file-name)))
         (call-interactively 'hippie-expand)))
     (global-set-key (kbd "C-M-/") 'my-expand-file-name-at-point)
     (defun org-toggle-link-display ()
       "Toggle the literal or descriptive display of links."
       (interactive)
       (if org-descriptive-links
           (progn (org-remove-from-invisibility-spec '(org-link))
                  (org-restart-font-lock)
                  (setq org-descriptive-links nil))
         (progn (add-to-invisibility-spec '(org-link))
                (org-restart-font-lock)
                (setq org-descriptive-links t))))

      (if (require 'toc-org nil t)
          (add-hook 'org-mode-hook 'toc-org-mode)
        (warn "toc-org not found"))
