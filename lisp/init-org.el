(require 'org)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/inbox.org" "Tasks")
         "* TODO %?\n Added: %U\n :%^{Tags|work|life|urgent}:\n  %i\n")
        ("n" "Next Actions" entry (file+headline "~/org/next_actions.org" "Next Actions")
         "* TODO %?\n Added: %U\n Scheduled: %^t\n Deadline: %^t\n :PROPERTY:\n :PROJECT: %^{Project Name}\n :END:\n  %i\n")
        ("p" "Project" entry (file+headline "~/org/projects.org" "Projects")
         "* %?\n  %i\n")
        ("s" "Maybe" entry (file+headline "~/org/maybe.org" "Someday/Maybe")
         "* SOMEDAY %?\n  %i\n")))

(provide 'init-org)
