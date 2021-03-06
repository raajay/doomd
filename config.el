;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Raajay Viswanathan"
      user-mail-address "raajay.v@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-journal-dir "~/org/journal/"            ; where my journal files are
      org-journal-file-format "%Y-%m-%d.org"  ; their file names
      org-journal-enable-agenda-integration t ; so entries are on the agenda
      ;; org-icalendar-store-UID t               ; so changes sync correctly
      ;; org-icalendar-include-todo "all"        ; include TODOs and DONEs
      ;; org-icalendar-combined-agenda-file "~/calendar/org-journal.ics"
      )
(after! org-capture
  (add-to-list 'org-capture-templates
               '("c" "Canvas Task"  entry
                 (file+headline +org-capture-todo-file "Canvas X")
                 "** TODO %?\n%i\n%a" :empty-lines 1))
  )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; `visual' does not count hidden lines.
(setq display-line-numbers-type 'visual)

;; Treat `_' as part of a word.
;; Src: https://emacs.stackexchange.com/questions/9583/how-to-treat-underscore-as-part-of-the-word
(modify-syntax-entry ?_ "w")

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 20)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(map! :leader
      :desc "Eval expression"       ":"    #'pp-eval-expression
      :desc "M-x"                   ";"    #'execute-extended-command)
