(defun del-head(num)
  (let ((head (line-beginning-position)))
    (delete-region head (+ num head))))

(defun ff(s e str)
  (interactive "r\nsString in line head[(re)t:del spaces|(/):del selected]: ")
  (save-excursion 
    (cond ((string= str "")
	   (goto-char s)
	   ;;(set-mark s)
	   (goto-char (line-beginning-position))
	   (while (re-search-forward "^[ \t]+" e t);;e:bound,t:no error
	     (replace-match "" ))
	   (message "line head spaces cleared."))
	  ((string= str "/") 
	   (goto-char e)
	   (let ((num (- e (line-beginning-position))))
	     (del-head num)
	     (while (and (> (point) s) (eq 0(forward-line -1)))
	       (del-head num)
	       ;;(previous-line)
	       ;;(forward-line -1)
	       ))
	   (message "line head deleted."))
	  (t 
	   (goto-char s)
	   (goto-char (line-beginning-position))
	   (while (re-search-forward "^" e t);;e:bound,t:no error
	     (replace-match str )
	     (setq e (+ e (length str)))
	     )
	   (message "line head changed.")))))

(provide 'insert_lx)
