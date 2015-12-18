(defmacro lx-face-add (letter backgrnd foregrnd mat sub)
"
这是一个自动生成face并且按
letter 是一个后缀，比如\"abc\",可以是多个字母，最后生成的face名是lx-face-abc
backgrnd 背景色，比如\"black\"
foregrnd 前景色,比如\"red\"
mat 匹配，比如\"ppp\\(abc\\)\"
sub 子分组的数字，0表示全部，1表示第一个分组
"
  (list 'progn
	`(defface ,(intern (concat "lx-face-"
				   letter))
	   '((((type tty) (class color)) 
	      (:background 
	       ,backgrnd
	       :foreground
	       ,foregrnd))
	     (((type tty) (class color)) (:inverse-video t))
	     (((class color) (background dark))
	      (:foreground
	       ,foregrnd
	       :background
	       ,backgrnd))
	     (((class color) (background light))
	      (:foreground
	       ,foregrnd
	       :background
	       ,backgrnd))
	     (t (:background "gray")))
	   ,(concat "Face for marking up " (upcase letter) "'s"))
	
	`(font-lock-add-keywords nil '((,mat ,sub ',(intern (concat "lx-face-" letter)) )))
;;	'(font-lock-fontify-buffer)
	)
  )
(defalias 'lx-remove-kwords 'font-lock-remove-keywords)

(defun lx-face-set(facesuffix foregd backgd)
  (set-face-attribute (intern (concat "lx-face-" facesuffix)) nil :background backgd :foreground foregd)
)

(provide 'add-face)
