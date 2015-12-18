(defun kid-cool-box (title begin end) 
  "Wrap the region with a cool box. 
The result is like this: 
,----------[ Title ] 
| This is the marked region 
| that will be boxed 
`---------- 
" 
  (interactive "sTitle: \nr") 
  (setq end (copy-marker end t)) 
  (save-excursion 
    (goto-char begin) 
    (unless (looking-back "^") 
      (insert "\n")) 
    (insert ",----------[ ") 
    (insert title) 
    (insert " ]\n") 
    (while (< (point) end) 
      (insert "| ") 
      (next-line) 
      (beginning-of-line)) 
    (goto-char end) 
    (unless (looking-back "^") 
      (insert "\n")) 
    (insert "`----------\n"))) 

(provide 'kid-cool-box)
