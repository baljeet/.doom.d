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
                  '(("n" "Notes" entry (file+headline "~/org/gtd/notes.org" "Inbox") "* %u %?\n%i\n%a" :prepend t))))



(after! org (add-to-list 'org-capture-templates
             '("h" "Track Habit" entry (file"~/org/habits.org")
"** TODO %?
:PROPERTIES:
:CREATED:    %U
:STYLE: habit
:END:
:RESOURCES:
:END:
"
:time-prompt t
)))

(after! org (add-to-list 'org-capture-templates
             '("d" "New Diary Entry" entry(file+olp+datetree"~/org/diary.org" "Daily Logs")
"* %^{Summarize in one sentence}
:PROPERTIES:
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
;;
;;Copied the following from https://github.com/nmartin84/.doom.d/blob/master/config.org
(defun my-deft/strip-quotes (str)
  (cond ((string-match "\"\\(.+\\)\"" str) (match-string 1 str))
        ((string-match "'\\(.+\\)'" str) (match-string 1 str))
        (t str)))

(defun my-deft/parse-title-from-front-matter-data (str)
  (if (string-match "^title: \\(.+\\)" str)
      (let* ((title-text (my-deft/strip-quotes (match-string 1 str)))
             (is-draft (string-match "^draft: true" str)))
        (concat (if is-draft "[DRAFT] " "") title-text))))

(defun my-deft/deft-file-relative-directory (filename)
  (file-name-directory (file-relative-name filename deft-directory)))

(defun my-deft/title-prefix-from-file-name (filename)
  (let ((reldir (my-deft/deft-file-relative-directory filename)))
    (if reldir
        (concat (directory-file-name reldir) " > "))))

(defun my-deft/parse-title-with-directory-prepended (orig &rest args)
  (let ((str (nth 1 args))
        (filename (car args)))
    (concat
      (my-deft/title-prefix-from-file-name filename)
      (let ((nondir (file-name-nondirectory filename)))
        (if (or (string-prefix-p "README" nondir)
                (string-suffix-p ".txt" filename))
            nondir
          (if (string-prefix-p "---\n" str)
              (my-deft/parse-title-from-front-matter-data
               (car (split-string (substring str 4) "\n---\n")))
            (apply orig args)))))))

(provide 'my-deft-title)

(use-package deft
  :commands (deft deft-open-file deft-new-file-named)
  :config
  (setq deft-directory "~/org/"
        deft-auto-save-interval 0
        deft-use-filename-as-title nil
        deft-current-sort-method 'title
        deft-recursive t
        deft-extensions '("md" "txt" "org")
        deft-markdown-mode-title-level 1
        deft-file-naming-rules '((noslash . "-")
                                 (nospace . "-")
                                 (case-fn . downcase))))
(require 'my-deft-title)
(advice-add 'deft-parse-title :around #'my-deft/parse-title-with-directory-prepended)
(add-hook 'org-mode-hook (lambda ()
  "Beautify Org Checkbox Symbol"
  (push '("[ ]" .  "☐") prettify-symbols-alist)
  (push '("[X]" . "☑" ) prettify-symbols-alist)
  (push '("[-]" . "❍" ) prettify-symbols-alist)
  (prettify-symbols-mode)))
(defface org-checkbox-done-text
  '((t (:foreground "#71696A" :strike-through t)))
  "Face for the text part of a checked org-mode checkbox.")

(font-lock-add-keywords
 'org-mode
 `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
    1 'org-checkbox-done-text prepend))
 'append)
