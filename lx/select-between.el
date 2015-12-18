(defun xah-select-text-in-bracket ()
  "Select text between the nearest brackets.
⁖  () [] {} «» ‹› “” 〖〗 【】 「」 『』 （） 〈〉 《》 〔〕 ⦗⦘ 〘〙 ⦅⦆ 〚〛 ⦃⦄ ⟨⟩."
  (interactive)
  (let (pos p1 p2 (parse-sexp-lookup-properties nil)
            (ξtemp-syn-table (make-syntax-table)))
    (modify-syntax-entry ?\« "(»" ξtemp-syn-table)
    (modify-syntax-entry ?\» ")«" ξtemp-syn-table)
    (modify-syntax-entry ?\‹ "(›" ξtemp-syn-table)
    (modify-syntax-entry ?\› ")‹" ξtemp-syn-table)
    (modify-syntax-entry ?\“ "(”" ξtemp-syn-table)
    (modify-syntax-entry ?\” ")“" ξtemp-syn-table)
   

    (modify-syntax-entry ?\< "(>" ξtemp-syn-table)
    (modify-syntax-entry ?\> ")<" ξtemp-syn-table)
    

    (with-syntax-table ξtemp-syn-table
      (setq pos (point))
      (search-backward-regexp "\\s(" nil t )
      (setq p1 (point))
      (forward-sexp 1)
      (setq p2 (point))
      (goto-char (1+ p1))
      (set-mark (1- p2))))
)


(defun lx-select-in-between()
   (interactive)
   (let (p1)
     (re-search-backward "[\\[{|<\"\\(]")
     (goto-char (1+ (point)))
     (set-mark  (point))
     (re-search-forward "[]}|>\"\\)]") ;;[]中间放]要相当小心，只能放在最前面
     (goto-char (1- (point)))))

(defun lx-select-backward()
   (interactive)
   (let ((p1 (point)))
     (set-mark  (point))
     (re-search-backward "[|<{\\[\"\\(]"  nil t)
    
     (if (not (equal p1 (+ 1 (point))))
	 (progn
	   (goto-char (1+ (point))))
       (progn
	 (lx-select-backward)))))


(defun lx-select-forward()
  (interactive)
  (let ((p1 (point)))
    (set-mark  (point))
    (re-search-forward "[]|>}\"\\)]"  nil t)
    (if  (not (equal p1 (1- (point))))
	(progn
	   (goto-char (1- (point))))
      (progn
	(lx-select-forward)))))

(provide 'select-between)


