(defun lx-note-to-html()
  (interactive) 
  (save-buffer)
  (let*
    ((dir (file-name-directory buffer-file-name))
    (base (file-name-base buffer-file-name))
    (ext (file-name-extension  buffer-file-name))
    (p1 dir)
    (p2 (format "%s.%s" base ext))
    (full-file-name (concat dir base "." ext))

    (ruby "c:/Ruby200/bin/ruby.exe ")
    (note "\"d:/Green_Soft/totalcmd7.5/Tools/LxNote_erb1.8.6/note_template_utf8.rb\" ")
    (str (concat  ruby note full-file-name))
    ;(str (format "%s %s %s %s" ruby note p1 p2))
    (str (replace-regexp-in-string "/" "\\\\" str)))
    (message str)
    (shell-command str)
    (message "Html done :)!")
    )
  )

(defun lx-dot()
  (interactive)
  (save-buffer)
  (let*
    ((dir (file-name-directory buffer-file-name))
    (base (file-name-base buffer-file-name))
    (ext (file-name-extension  buffer-file-name))
    
    (full-file-name (concat  base "." ext))

    (ruby "c:/Ruby200/bin/ruby.exe --encoding=utf-8 ")
    
    )
    ;(str (format "%s %s %s %s" ruby note p1 p2))
					;(str (replace-regexp-in-string "/" "\\\\" str)))
    (message ext)
    (if (string= ext "rb")
	(progn
	  
	  (message (concat ruby full-file-name))
	  (shell-command (concat ruby full-file-name)))

      (progn
	(message (concat ruby "d:/Green_Soft/emacs-24.5/bin/lx/graphviz_temp.rb " full-file-name))
	  (shell-command (concat ruby "d:/Green_Soft/emacs-24.5/bin/lx/graphviz_temp.rb " full-file-name))))
    (message "Graphviz output done :)!")
    )
  )
;;;---------------------------------------------------------
(defun k1()
  (interactive)
  (goto-char (line-beginning-position))
  (insert "* ")
)
(defun k2()
  (interactive)
  (goto-char (line-beginning-position))
  (insert "** ")
)
(defun k3()
  (interactive)
  (goto-char (line-beginning-position))
  (insert "*** ")
)
;;{{{
;;======在dired 模式插入marked文件名
(defvar note-file-name "hello lx" "Current note file name.")
(defun lx-insert-file-names(&optional buffername)
  "在dired 模式插入marked文件名到指定buffer
   快捷键  C-c i"
  

    ;(interactive "P")
  (interactive
   (if (and current-prefix-arg ) 
       ;;有前缀参数
       
     
       (list (read-buffer "Buffer name: "))))
;; (if (and current-prefix-arg (not (consp current-prefix-arg))) 
  (if (and current-prefix-arg ) 

       (setq note-file-name buffername)

     (setq buffername note-file-name))
     ;; (list (prefix-numeric-value current-prefix-arg)) 
    ;; (if buffername
    ;; 	(progn
    ;; 	   ;(setq buffername (read-from-minibuffer "Buffer name: "))
    ;; 	    (setq note-file-name buffername))
    ;; 	(setq buffername note-file-name)
    ;;   )
    (let ((files (dired-get-marked-files t)))
      
      (set-buffer buffername)
      (while files
	(let ((file (car files)))
	  (insert "{{")
	  (insert file)
	  (insert "}}")
	  (insert "\n")
	  )
	(setq files (cdr files)))))
;;----------------------------------------------------------------------
(defvar lx-insert-buffer-name nil "Current insert buffer name.")
(defun lx-insert-selected-to-other-buffer(s e &optional buffername)
  "======插入选中内容到指定buffer:
         加前缀可以选择buffer，
         不加前缀插入到当前默认的buffer"
    ;(interactive "P")
  (interactive
   (if current-prefix-arg
       ;;有前缀参数
       (list (region-beginning) (region-end) (read-buffer "Buffer name: "))
     (list (region-beginning) (region-end))
     )
   )
  (if current-prefix-arg
      (setq lx-insert-buffer-name buffername ))
  (if (null lx-insert-buffer-name)
      (setq lx-insert-buffer-name (read-buffer "Buffer name: "))
    (setq buffername lx-insert-buffer-name))
  ;;(kill-ring-save s e)
  ;;(yank)
  ;;(insert "\n")
  (let*
      ((oldbuf (current-buffer))
       (windows (get-buffer-window-list  lx-insert-buffer-name t t))
       point )
    (set-buffer lx-insert-buffer-name)
    (setq point (point))
    (insert-buffer-substring oldbuf s e)
    (insert "\n")
    ;;(message (int-to-string point))
    (dolist (window windows)
      ;;(message window)
      (when (= (window-point window) point)
	(message "---------------!!!")
	(set-window-point window (+ (- e s) point 1))))
    (message (concat "Insert buffer is " lx-insert-buffer-name))))
	
(defun lx-copy-file-names()
  "C-c n"
  (interactive )
  (let ((files (dired-get-marked-files t))
	(fullname (dired-utils-get-filename))
	)
    (setq fullname (replace-regexp-in-string "[^/]+$" "" fullname))
    (kill-new fullname)
    (kill-new "")
    (while files
      (let ((file (car files)))
	
	(kill-append file nil)
	(kill-append "\n" nil)
	)
      (setq files (cdr files)))
    ;
))
(defun lx-copy-path()
   "C-c d"
  (interactive )
  (let (
	(fullname (dired-utils-get-filename))
	)
    (setq fullname (replace-regexp-in-string "/[^/]+$" "" fullname))
    (kill-new fullname)))
;;}}}

(defun lx-paste-clipboard-image-into(name)
   "C-c y"
  (interactive "sImage file name(.png): " )
  (let*
      ((fullname (dired-utils-get-filename))
       (fullpath (replace-regexp-in-string "/[^/]+$" "" fullname))
       (fullpath (replace-regexp-in-string "/" "\\\\" fullpath))
       )
    (message fullpath)
    (call-process "d:\\Green_Soft\\totalcmd7.5\\Tools\\IrfanViewPortable\\App\\IrfanView\\i_view32.exe" 
 		  nil 0 nil       
 		  (concat "/clippaste /convert=" fullpath "\\" name ".png"))
    (kill-new (concat name ".png"))
))

(require 'org)
(defun lx-syn-on()
  (interactive)
  ;;(org-mode)
  ;; (defvar headline-221)
  ;; (defface headline-221
  ;;   '((t :foreground "white" :background "#ffffff"))
  ;;   "我自定义的yellow face")
  ;(hi-lock-face-buffer "^* .*"  'custom-button)
  (font-lock-add-keywords nil '(("^*+\\([^\t\n]*\\)" 1 'custom-button))) 
  (hi-lock-face-buffer "^\\*\\{1,5\\}"  'org-hide)
  
  (hi-lock-face-buffer "^*\\* .*"  'error)
  (hi-lock-face-buffer "^*\\*\\* .*"  'custom-variable-tag)
 
)

;; (re-search-forward "^*+\\([^\t\n]*\\)")

;; *******

(defun pre(s e)
  (interactive "r")
  
  (save-excursion
    (goto-char s)
    (if 
	(re-search-forward "\n" e t)
	(progn 
	  ;(message "---aaa")
	  (goto-char e) 
	  (goto-char (line-end-position))
	  (insert "\n>>")
	  (goto-char s) 
	  (goto-char (line-beginning-position))
	  (insert "<<\n"))
      (progn
	(goto-char e) (insert ">>")
	(goto-char s) (insert "<<")))))

(defun **(s e)
  (interactive "r")
  (save-excursion
    (goto-char e) (insert "**")
    (goto-char s) (insert "**")
    )
)
(defun **_(s e)
  (interactive "r")
  (save-excursion
    (goto-char e) (insert "_**")
    (goto-char s) (insert "**_")
    )
)
(defun **-(s e)
  (interactive "r")
  (save-excursion
    (goto-char e) (insert "-**")
    (goto-char s) (insert "**-")
    )
)
(defun img(s e)
  (interactive "r")
  (save-excursion
    (goto-char e) (insert "}}")
    (goto-char s) (insert "{{")
    )
)

(defun h_ref(s e)
  (interactive "r")
  (save-excursion
    (goto-char e) (insert "</A>")
    (goto-char s) (insert "<A HREF=\"\">")
    )
  (goto-char s)
  (forward-char 9)
)
;;;------------------------------------------------------------------
     
(provide 'lxnote_rb)


