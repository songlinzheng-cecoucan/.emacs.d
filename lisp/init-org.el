(require 'org)

;; 启用 org-indent-mode
(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/inbox.org" "Tasks")
         "* TODO %?\n Added: %U\n :%^{Tags|work|life|urgent}:\n  %i\n")
        ("n" "Next Actions" entry (file+headline "~/org/next_actions.org" "Next Actions")
         "* TODO %?\nAdded: %U\nScheduled: %^t\n:PROPERTY:\n:CATEGORY: %^{Category}\n:Effort: %^{Effort}\n:END:\n  %i\n")
        ("p" "Project" entry (file+headline "~/org/projects.org" "Projects")
         "* %?\n Added: %U\n Scheduled: %^t\n  %i\n")
        ("s" "Maybe" entry (file+headline "~/org/maybe.org" "Maybe")
         "* SOMEDAY %?\n  %i\n")
	("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %? :JOURNAL:\nTime: %U\n  %i\n")
	("r" "Ref" entry (file+headline "~/org/ref.org" "Ref")
	 "* %? :REF:\nTime: %U\n %i\n")
        ("e" "Expenditure" entry (file+datetree "~/org/expenses.org")
         "* %^{Description} :EXPD:\nAdded: %U AMOUNT: %^{Amount} DETAILS: %^{Details}\n")))

(setq org-refile-targets '((nil :maxlevel . 4)
                           ("~/org/projects.org" :maxlevel . 4)
                           ("~/org/next_actions.org" :maxlevel . 4)
                           ("~/org/inbox.org" :maxlevel . 4)
                           ("~/org/maybe.org" :maxlevel . 4)
			   ("~/org/ref.org" :maxlevel . 4)))

(setq org-agenda-files '(("~/org/next_actions.org")
			 ("~/org/projects.org")))

;; (setq org-agenda-use-time-grid t)

;; (setq org-agenda-custom-commands
;;       '(("d" "Daily Agenda"
;; 	 ((agenda ""
;; 		  ((org-agenda-span 'day)
;; 		   (org-agenda-overriding-header "Today's Schedule and Deadline Tasks")
;; 		   (org-agenda-timeline-commands t)))))))

;; 自定义显示 TODO 状态的格式
;; (setq org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t %s %e")
;;                                  (todo . " %i %-12:c%?-12t %s %e")
;;                                  (tags . " %i %-12:c%?-12t %s %e")))

(setq org-agenda-custom-commands
      '(("z" "Daily Agenda"
         ((agenda "" ((org-agenda-span 'day)
                      (org-agenda-start-day "-0d")
		      (org-agenda-sorting-strategy '((agenda time-up priority-down)
						     (todo time-up)
						     (tags time-up)
						     (search time-up)))))))))

;; (defun my/org-checkbox-checked-hook ()
;;   "When a checkbox is checked, add a closed time to the parent heading's LOGBOOK."
;;   (when (and (org-at-item-checkbox-p) ; 检查是否在复选框上
;;              (org-region-active-p)    ; 检查是否有选中区域
;;              (string= (org-get-todo-state) "DONE")) ; 检查是否标记为完成
;;     (save-excursion
;;       (let ((logbook (org-entry-get (point) "LOGBOOK")))
;;         (unless logbook
;;           (org-set-property "LOGBOOK" "") ; 如果没有 LOGBOOK 抽屉，则创建
;;           (setq logbook ""))
;;         (org-add-log-setup 'state 'done 'note nil t) ; 添加时间戳
;;         (org-update-statistics-cookies t))))) ; 更新统计信息

;; (defun my/org-checkbox-toggle ()
;;   "自定义的 Org checkbox 切换函数，勾选时记录完成时间，如果没有 LOGBOOK 抽屉则创建。"
;;   (let ((current-time (format-time-string "%Y-%m-%d %H:%M:%S"))
;;         (logbook-start-regex "^#\\+LOGBOOK:")
;;         (logbook-entry-regex "^\\*+\\s-"))
;;     ;; 查找当前标题下的 LOGBOOK 抽屉
;;     (save-excursion
;;       (org-back-to-heading t)  ;; 定位到当前标题
;;       (if (re-search-forward logbook-start-regex (line-end-position) t)
;;           ;; 如果找到 LOGBOOK 抽屉，添加完成时间
;; 	  (message "Current point: %d" (point)
;;           (progn
;;             (end-of-line)
;;             (insert (concat "\n- Closed: " current-time)))
;;         ;; 如果没有找到 LOGBOOK 抽屉，则创建 LOGBOOK 抽屉并添加时间
;;         (progn
;;           (goto-char (line-end-position))
;;           (insert "\n#+LOGBOOK:\n")
;;           (insert (concat "- Closed: " current-time))))))

;; (defun my/org-checkbox-hook ()
;;   "Org-mode 勾选框状态变化时触发的钩子，调用自定义的勾选切换函数。"
;;   (when (and (org-at-item-checkbox-p)
;; 	     (org-region-active-p)    ; 检查是否有选中区域
;; 	     (string= (org-get-todo-state) "DONE"))) ; 检查是否标记为完成
;;     (my/org-checkbox-toggle)))

;; (add-hook 'org-checkbox-statistics-hook 'my/org-checkbox-hook)

;; ;; 添加钩子函数
;; (add-hook 'org-checkbox-statistics-hook 'my/org-checkbox-checked-hook)

(setq org-log-done 'time)

(setq org-archive-location "~/org/archive.org::")

(defun print-current-point ()
  "Print the current point (cursor position) to the minibuffer."
  (interactive)
  (message "Current point: %d" (point)))

(provide 'init-org)
