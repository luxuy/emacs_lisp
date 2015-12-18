(defmacro lx-face-add (letter backgrnd foregrnd mat sub)
"
����һ���Զ�����face���Ұ�
letter ��һ����׺������\"abc\",�����Ƕ����ĸ��������ɵ�face����lx-face-abc
backgrnd ����ɫ������\"black\"
foregrnd ǰ��ɫ,����\"red\"
mat ƥ�䣬����\"ppp\\(abc\\)\"
sub �ӷ�������֣�0��ʾȫ����1��ʾ��һ������
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
