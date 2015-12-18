;;(put 'scroll-up 'unscrollable t) 
;;(put 'scroll-down 'unscrollable t) 
;;(put 'scroll-left 'unscrollable t) 
;;(put 'scroll-right 'unscrollable t) 

(defvar unscroll-point nil 
  "Cursor position for next call to 'unscroll'.") 
(defvar unscroll-window-start nil 
  "Window start for next call to 'unscroll'.") 
(defvar  unscroll-hscroll nil 
  "Window hscroll for next call to 'unscroll'.") 
(defun unscroll-maybe-remember () 
  (setq this-command 'unscrollable) 
  (if (not (eq last-command 'unscrollable))
      (setq unscroll-point (point) 
	    unscroll-window-start (window-start) 
	    unscroll-hscroll (window-hscroll))
    ;;(message "------------is scrollable.")
    )) 

(defadvice scroll-up (before remember-for-unscroll 
			     activate compile) 
  "Remember where we started from, for 'unscroll'." 
  (unscroll-maybe-remember)) 
(defadvice scroll-down (before remember-for-unscroll 
			       activate compile) 
  "'Remember where we started from, for 'unscroll'." 
  
  (unscroll-maybe-remember)) 
(defadvice scroll-left (before remember-for-unscroll 
			       activate compile) 
  "Remember where we started from, for 'unscroll'." 
  (unscroll-maybe-remember)) 
(defadvice scroll-right (before remember-for-unscroll 
				activate compile) 
  "Remember where we started from, for 'unscroll'." 
  (unscroll-maybe-remember)) 
;;======================================================
(defun unscroll () 
        "Revert to 'unscroll-point' and 'unscroll-window-start'." 
        (interactive) 
        (goto-char unscroll-point) 
        (set-window-start nil unscroll-window-start) 
        (set-window-hscroll nil unscroll-hscroll)) 
(provide 'unscroll)