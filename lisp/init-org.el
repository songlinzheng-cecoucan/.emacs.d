(require 'org)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/inbox.org" "Tasks")
         "* TODO %?\n Added: %U\n :%^{Tags|work|life|urgent}:\n  %i\n")
        ("n" "Next Actions" entry (file+headline "~/org/next_actions.org" "Next Actions")
         "* TODO %?\n Added: %U\n Scheduled: %^t\n Deadline: %^t\n:PROPERTY:\n:LINK: %^{Link}\n:PROJECT: %^{Project Name}\n:END:\n  %i\n")
        ("p" "Project" entry (file+headline "~/org/projects.org" "Projects")
         "* %?\n Added: %U\n Scheduled: %^t\n  %i\n")
        ("s" "Maybe" entry (file+headline "~/org/maybe.org" "Maybe")
         "* SOMEDAY %?\n  %i\n")
	("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n")
	("r" "Ref" entry (file+headline "~/org/ref.org" "Ref")
	 "* %?\nEntered on %U\n %i\n")))

(setq org-refile-targets '((nil :maxlevel . 3)
                           ("~/org/projects.org" :maxlevel . 3)
                           ("~/org/next_actions.org" :maxlevel . 3)
                           ("~/org/inbox.org" :maxlevel . 3)
                           ("~/org/maybe.org" :maxlevel . 3)
			   ("~/org/ref.org" :maxlevel . 3)))

(setq org-log-done 'time)

(provide 'init-org)
