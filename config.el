;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Baljeet Kumar"
      user-mail-address "promragger@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Source Code Pro" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-gruvbox)

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


(after! org (setq org-agenda-diary-file "~/org/diary.org"
                  org-agenda-use-time-grid nil
                  org-agenda-skip-scheduled-if-done t
                  org-agenda-skip-deadline-if-done t
                  org-habit-show-habits t))

(load-library "find-lisp")
(after! org (setq org-agenda-files
                  (find-lisp-find-files "~/org/" "\.org$")))

(after! org (setq org-capture-templates
                  '(("g" "Getting things done")
                    ("r" "References")
                    ("d" "Diary")
                    ("p" "Graph Data")
                    ("t" "Data Tracker"))))

(after! org (add-to-list 'org-capture-templates
                         '("gr" "Recurring Task" entry (file "~/org/gtd/recurring.org")
                           "* TODO %^{description}
:PROPERTIES:
:CREATED:    %U
:END:
:RESOURCES:
:END:
+ NOTES:
  %?")))

(after! org (add-to-list 'org-capture-templates
             '("gp" "Project" entry (file+headline"~/org/gtd/tasks.org" "Projects")
"* TODO %^{Description}
:PROPERTIES:
:SUBJECT: %^{subject}
:GOAL:    %^{goal}
:END:
:RESOURCES:
:END:
+ REQUIREMENTS:
  %^{requirements}
+ NOTES:
  %?
\** TODO %^{task1}")))

(after! org (add-to-list 'org-capture-templates
             '("gt" "Capture Task" entry (file"~/org/gtd/inbox.org")
"** TODO %?
:PROPERTIES:
:CREATED:    %U
:END:
:RESOURCES:
:END:
+ NEXT STEPS:
  - [ ] %^{next steps}
+ NOTES:")))

(after! org (add-to-list 'org-capture-templates
             '("re" "Yank new Example" entry(file+headline"~/org/notes/examples.org" "INBOX")
"* %^{example}
:PROPERTIES:
:SOURCE:  %^{source|Command|Script|Code|Usage}
:SUBJECT: %^{subject}
:END:
\#+BEGIN_SRC %^{lang}
%x
\#+END_SRC
%?")))

(after! org (add-to-list 'org-capture-templates
             '("rn" "Yank new Example" entry(file+headline"~/org/notes/references.org" "INBOX")
"* %^{example}
:PROPERTIES:
:CATEGORY: %^{category}
:SUBJECT:  %^{subject}
:END:
:RESOURCES:
:END:
%?")))

(after! org (add-to-list 'org-capture-templates
             '("dn" "New Diary Entry" entry(file+olp+datetree"~/org/diary.org" "Daily Logs")
"* %^{thought for the day}
:PROPERTIES:
:CATEGORY: %^{category}
:SUBJECT:  %^{subject}
:MOOD:     %^{mood}
:END:
:RESOURCES:
:END:
\*What was one good thing you learned today?*:
- %^{whatilearnedtoday}
\*List one thing you could have done better*:
- %^{onethingdobetter}
\*Describe in your own words how your day was*:
- %?")))

(after! org (setq org-directory "~/org/"
                  org-image-actual-width nil
                  +org-export-directory "~/.export/"
                  org-archive-location "~/org/gtd/archive.org::datetree/"
                  org-default-notes-file "~/org/gtd/inbox.org"
                  projectile-project-search-path '("~/")))

(after! org (setq org-html-head-include-scripts t
                  org-export-with-toc t
                  org-export-with-author t
                  org-export-headline-levels 5
                  org-export-with-drawers t
                  org-export-with-email t
                  org-export-with-footnotes t
                  org-export-with-latex t
                  org-export-with-section-numbers nil
                  org-export-with-properties t
                  org-export-with-smart-quotes t
                  org-export-backends '(pdf ascii html latex odt pandoc)))

(after! org (setq org-todo-keyword-faces
      '(("TODO" :foreground "tomato" :weight bold)
        ("WAITING" :foreground "light sea green" :weight bold)
        ("STARTED" :foreground "DodgerBlue" :weight bold)
        ("DELEGATED" :foreground "Gold" :weight bold)
        ("NEXT" :foreground "violet red" :weight bold)
        ("DONE" :foreground "slategrey" :weight bold))))

(after! org (setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w!)" "STARTED(s!)" "NEXT(n!)" "DELEGATED(e!)" "|" "INVALID(I!)" "DONE(d!)"))))

(after! org (setq org-link-abbrev-alist
                  '(("doom-repo" . "https://github.com/hlissner/doom-emacs/%s")
                    ("wolfram" . "https://wolframalpha.com/input/?i=%s")
                    ("duckduckgo" . "https://duckduckgo.com/?q=%s")
                    ("gmap" . "https://maps.google.com/maps?q=%s")
                    ("gimages" . "https://google.com/images?q=%s")
                    ("google" . "https://google.com/search?q=")
                    ("youtube" . "https://youtube.com/watch?v=%s")
                    ("youtu" . "https://youtube.com/results?search_query=%s")
                    ("github" . "https://github.com/%s")
                    ("attachments" . "~/org/.attachments/"))))

(after! org (setq org-log-state-notes-insert-after-drawers nil
                  org-log-into-drawer t
                  org-log-done 'time
                  org-log-repeat 'time
                  org-log-redeadline 'note
                  org-log-reschedule 'note))


(after! org (setq org-publish-project-alist
                  '(("references-attachments"
                     :base-directory "~/org/notes/images/"
                     :base-extension "jpg\\|jpeg\\|png\\|pdf\\|css"
                     :publishing-directory "~/publish_html/references/images"
                     :publishing-function org-publish-attachment)
                    ("references-md"
                     :base-directory "~/org/notes/"
                     :publishing-directory "~/publish_md"
                     :base-extension "org"
                     :recursive t
                     :headline-levels 5
                     :publishing-function org-html-publish-to-html
                     :section-numbers nil
                     :html-head "<link rel=\"stylesheet\" href=\"http://thomasf.github.io/solarized-css/solarized-light.min.css\" type=\"text/css\"/>"
                     :infojs-opt "view:t toc:t ltoc:t mouse:underline buttons:0 path:http://thomas.github.io/solarized-css/org-info.min.js"
                     :with-email t
                     :with-toc t)
                    ("tasks"
                     :base-directory "~/org/gtd/"
                     :publishing-directory "~/publish_tasks"
                     :base-extension "org"
                     :recursive t
                     :auto-sitemap t
                     :sitemap-filename "index"
                     :html-link-home "../index.html"
                     :publishing-function org-html-publish-to-html
                     :section-numbers nil
                     ;:html-head "<link rel=\"stylesheet\"
                     ;href=\"https://codepen.io/nmartin84/pen/MWWdwbm.css\"
                     ;type=\"text/css\"/>"
                     :with-email t
                     :html-link-up ".."
                     :auto-preamble t
                     :with-toc t)
                    ("pdf"
                     :base-directory "~/org/gtd/references/"
                     :base-extension "org"
                     :publishing-directory "~/publish"
                     :preparation-function somepreparationfunction
                     :completion-function  somecompletionfunction
                     :publishing-function org-latex-publish-to-pdf
                     :recursive t
                     :latex-class "koma-article"
                     :headline-levels 5
                     :with-toc t)
                    ("myprojectweb" :components("references-attachments" "pdf" "references-md" "tasks")))))

(after! org (setq org-refile-targets '((org-agenda-files . (:maxlevel . 6)))
                  org-hide-emphasis-markers nil
                  org-outline-path-complete-in-steps nil
                  org-refile-allow-creating-parent-nodes 'confirm))

(after! org (setq org-startup-indented t
                  org-src-tab-acts-natively t))
(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-num-mode)

(defun org-clock-switch ()
  "Switch task and go-to that task"
  (interactive)
  (setq current-prefix-arg '(12)) ; C-u
  (call-interactively 'org-clock-goto)
  (org-clock-in)
  (org-clock-goto))
(provide 'org-clock-switch)

(org-super-agenda-mode t)
(after! org-agenda (setq org-agenda-custom-commands
                         '(("t" "Tasks"
                            ((agenda ""
                                     ((org-agenda-files '("~/org/gtd/tasks.org" "~/org/gtd/tickler.org" "~/org/gtd/projects.org"))
                                      (org-agenda-overriding-header "What's on my calendar")
                                      (org-agenda-span 'day)
                                      (org-agenda-start-day (org-today))
                                      (org-agenda-current-span 'day)
                                      (org-super-agenda-groups
                                       '((:name "[[~/org/gtd/habits.org][Habits]]"
                                                :habit t
                                                :order 1)
                                         (:name "[[~/org/gtd/recurring.org][Bills]]"
                                                :tag "@bills"
                                                :order 4)
                                         (:name "Today's Schedule"
                                                :time-grid t
                                                :scheduled t
                                                :deadline t
                                                :order 13)))))
                             (todo "TODO|NEXT|REVIEW|WAITING|IN-PROGRESS"
                                   ((org-agenda-overriding-header "[[~/org/gtd/tasks.org][Task list]]")
                                    (org-agenda-files '("~/org/gtd/tasks.org"))
                                    (org-super-agenda-groups
                                     '((:name "CRITICAL"
                                              :priority "A"
                                              :order 1)
                                       (:name "NEXT UP"
                                              :todo "NEXT"
                                              :order 2)
                                       (:name "Emacs Reading"
                                              :and (:category "Emacs" :tag "@read")
                                              :order 3)
                                       (:name "Emacs Config"
                                              :and (:category "Emacs" :tag "@configure")
                                              :order 4)
                                       (:name "Emacs Misc"
                                              :category "Emacs"
                                              :order 5)
                                       (:name "Task Reading"
                                              :and (:category "Tasks" :tag "@read")
                                              :order 6)
                                       (:name "Task Other"
                                              :category "Tasks"
                                              :order 7)
                                       (:name "Projects"
                                              :category "Projects"
                                              :order 8)))))
                             (todo "DELEGATED"
                                   ((org-agenda-overriding-header "Delegated Tasks by WHO")
                                    (org-agenda-files '("~/org/gtd/tasks.org"))
                                    (org-super-agenda-groups
                                     '((:auto-property "WHO")))))
                             (todo ""
                                   ((org-agenda-overriding-header "References")
                                    (org-agenda-files '("~/org/gtd/references.org"))
                                    (org-super-agenda-groups
                                     '((:auto-ts t)))))))
                           ("i" "Inbox"
                            ((todo ""
                                   ((org-agenda-files '("~/org/gtd/inbox.org"))
                                    (org-agenda-overriding-header "Items in my inbox")
                                    (org-super-agenda-groups
                                     '((:auto-ts t)))))))
                           ("x" "Get to someday"
                            ((todo ""
                                        ((org-agenda-overriding-header "Projects marked Someday")
                                         (org-agenda-files '("~/org/gtd/someday.org"))
                                         (org-super-agenda-groups
                                          '((:auto-ts t))))))))))
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.