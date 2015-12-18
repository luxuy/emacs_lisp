;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LX's .emacs file
;;; Last modified time
;;; Time-stamp: <2015-11-05>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "Liu Xiang")
(setq user-mail-address "ulganix@126.com")



;;======================================================================路径设置

;;
;;加载和编辑.emacs
(global-set-key (kbd "<f12>") (lambda () (interactive) (find-file-other-window user-init-file)))
(global-set-key (kbd "<C-f12>") (lambda () (interactive) (load (concat (expand-file-name "~") "/.emacs"))))
(global-set-key (kbd "C-c z") 'shell)
(global-set-key (kbd "<f10>") 'rename-buffer)
(setq lx-path "d:/Green_Soft/emacs-24.5/bin/")
(setenv "HOME" lx-path)
;(setq lx-path (expand-file-name "~"))
(add-hook 'dired-load-hook
          (lambda () (require 'dired-sort-menu+)))

(setenv "PATH" (concat (getenv "PATH") ";" lx-path))

;;set the default file path
(setq default-directory "~")
(add-to-list 'load-path "~/lx")

(setq bookmark-default-file "~/.emacs.d/.emacs.bmk");书签文件
;(org-mode t)
;;(setq initial-major-mode (quote org-mode))



;;========================================================================Emacs设置
(setq make-backup-files nil) ;不产生后缀为"~"的备份文件
;;(setq backup-directory-alist (quote (("." . "~/.backups")))) ;备份文件归位
;;=======

  

;;==========================================================

(setq default-major-mode 'text-mode)  
;;(add-hook 'text-mode-hook 'turn-on-auto-fill)  
;;设置缺省主模式是text，,并进入auto-fill次模式.而不是基本模式fundamental-mode  
(setq visible-bell t) ;关闭出错提示音
(setq inhibit-startup-message t) ;关闭启动画面
(setq column-number-mode t) ;显示列号
(setq mouse-yank-at-point t);不要在鼠标中键点击的那个地方插入剪贴板内容，而是在光标处。
(setq kill-ring-max 200);剪切环最大值
(setq frame-title-format "%f");标题栏显示buffer name
(auto-image-file-mode);直接显示图片
(setq highlight-nonselected-windows t);非当前窗口的region也高亮显示
(show-paren-mode t)
(setq show-paren-style 'parentheses);关闭括号跳动
(setq enable-recursive-minibuffers t);递归使用minibuffer
(setq resize-mini-windows t);minibuffer自动调整宽度
(setq scroll-margin 3 scroll-conservatively 10000);防止页面滚动时跳动
(global-linum-mode 1);显示行号
;;(global-hl-line-mode 1);高亮当前行
(menu-bar-no-scroll-bar);去掉滚动条
(tool-bar-mode -1);去掉图标
;;光标显示为一竖线  
(setq-default cursor-type 'bar)  
;;可以显示图片  
(auto-image-file-mode t)  

(setq-default line-spacing 5);修改默认行距，显示中文好看
;;(cua-mode t);开启cua mode
(outline-minor-mode t)
(setq lx-entry-folded-p nil)
(defun switch-in-out-entry()
  (interactive)
  (outline-minor-mode t)
  (if lx-entry-folded-p
      (progn
	(show-entry)
	(setq lx-entry-folded-p nil))
    (progn
      (hide-entry)
      (setq lx-entry-folded-p t))))
(global-set-key (kbd "<f9>") 'switch-in-out-entry)
(global-set-key (kbd "<C-f9>") 'hide-body)

(blink-cursor-mode -1);禁用光标闪烁
(fset 'yes-or-no-p 'y-or-n-p);;所有的问题用y/n方式，不用yes/no方式。有点懒，只想输入一个字母
;;(mouse-avoidance-mode 'animate);鼠标自动避开指针

(global-visual-line-mode t);开启可视模式，自动换行
(setq display-time-format "%Y年%m月%d日 %A %H:%M");显示时间的格式
(display-time-mode 1)
(setq display-time-interval 10);时间的变化频率
(setq display-time-24hr-format t);时间使用24小时制
(setq display-time-day-and-date t);时间显示包括日期和具体时间
(when window-system (set-frame-size (selected-frame) 150 62));设置窗口尺寸
(when window-system (set-frame-position (selected-frame) 400 0));设置窗口位置
;;(hs-minor-mode t)  
;;IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;;ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;============================================================自动补全
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-l
      '(
	    ;senator-try-expand-semantic ;优先调用了senator的分析结果-很慢-还是使用吧
	try-expand-line ; 补全当前行
	try-expand-line-all-buffers
	try-expand-list ; 补全一个列表
	try-expand-list-all-buffers
	try-expand-dabbrev ; 搜索当前 buffer
	try-expand-dabbrev-visible ; 搜索当前可见窗口
	try-expand-dabbrev-all-buffers ; 搜索所有 buffer
	try-expand-dabbrev-from-kill ; 从 kill-ring 中搜索
	try-complete-file-name ; 文件名匹配
	try-complete-file-name-partially ; 文件名部分匹配
	try-complete-lisp-symbol ; 补全 lisp symbol
	try-complete-lisp-symbol-partially ; 部分补全 elisp symbol
	try-expand-whole-kill
	)
      )
;;=======================================跳到minbuffer
(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(global-set-key "\C-co" 'switch-to-minibuffer) ;; Bind to `C-c o'




;;=====================================**load**=====加载插件
;;; Smex
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-M-y") 'secondary-dwim)
;;使用方法，比如：lxfwd 自动匹配lx-select-forword,忽略中间的字符。C-s,C-r前后，enter选定。

(require 'kid-cool-box)
(require 'insert_lx)
(require 'lxnote_rb)
(require 'select-between)
(require 'unscroll)
(require 'add-face)
(require 'run-cur-file)
(if (functionp 'global-hi-lock-mode)
            (global-hi-lock-mode 1)
          (hi-lock-mode 1))


;(load "icicles")
(require 'smart-copy)
(require 'org)
(require 'pager)
(global-set-key "\C-v"	   'pager-page-down)
(global-set-key [next]	   'pager-page-down)
(global-set-key "\ev"	   'pager-page-up)
(global-set-key [prior]	   'pager-page-up)
(global-set-key '[M-up]	   'pager-row-up)
(global-set-key '[M-kp-8]  'pager-row-up)
(global-set-key '[M-down]  'pager-row-down)
(global-set-key '[M-kp-2]  'pager-row-down)

;;=====================================字体设置
;; Setting English Font
;;(set-face-attribute 'default nil :font "Consolas 12")
;(require 'unicad)
;----编码问题
;(prefer-coding-system 'chinese-gbk)
(prefer-coding-system 'utf-8)
(set-coding-system-priority  'utf-8 'chinese-gbk)
;; GBK settings:
(set-language-environment 'Chinese-gbk)
(set-terminal-coding-system 'chinese-gbk)
(set-selection-coding-system 'chinese-gbk)
(set-keyboard-coding-system 'chinese-gbk)
(set-clipboard-coding-system 'chinese-gbk)
(set-buffer-file-coding-system 'chinese-gbk)
(modify-coding-system-alist 'process "*" 'chinese-gbk)


;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "黑体"
                                       )))




;;=====================================快捷键
(global-unset-key (kbd "C-z"))  
(global-set-key (kbd "C-z") 'keyboard-quit)
;;(global-set-key (kbd "C-1") 'set-mark-command)
(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
  This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))
(global-set-key (kbd "M-`") 'jump-to-mark)

(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
   Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t t)
  (message "Pushed mark to ring"))

(global-set-key (kbd "C-`") 'push-mark-no-activate)

;;(global-unset-key (kbd "C-f2")) 
(global-set-key (kbd "<C-f2>") 'xah-select-text-in-bracket)
(global-set-key (kbd "<f2>") 'lx-select-in-between)
(global-set-key (kbd "C-,") 'lx-select-backward)
(global-set-key (kbd "C-.") 'lx-select-forward)

(define-prefix-command 'X-map)

;;(global-set-key (kbd "<C-tab>") 'switch-windows) 


(global-set-key (kbd "M-w") 'kill-ring-save) 

(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(defun lx-previous-frame()
  "Switch to previous frame."
  (interactive)
  (set-mouse-position (next-frame) 6 6)
  (other-frame 1))
(global-set-key (kbd "<M-wheel-down>") 'lx-previous-frame)
(defun lx-next-frame()
  "Switch to next frame."
  (interactive)
  (set-mouse-position (previous-frame) 6 6)
;;(set-mouse-position frame x y) x y是字符数量
;;The arguments x and y are integers, giving the position in characters relative to the top left corner of the inside of frame
  (other-frame -1))
(global-set-key (kbd "<M-wheel-up>") 'lx-next-frame)

(defun lx-previous-win() ;;名称不能是window,和内部函数冲突
  "Switch to previous window."
  (interactive)
  (other-window 1))

(global-set-key (kbd "<S-wheel-down>") 'lx-previous-win)
(defun lx-next-win()
  "Switch to next window."
  (interactive)
  (other-window -1))

(global-set-key (kbd "<S-wheel-up>") 'lx-next-win)
;;==========================自定义主键
(global-set-key (kbd "X") 'X-map)
(define-key X-map (kbd "c") 'org-table-copy-region) 
(define-key X-map (kbd "v") 'org-table-paste-rectangle) 
(define-key X-map (kbd "ii") 'kid-cool-box)
(define-key X-map (kbd "1") 'k1)
(define-key X-map (kbd "2") 'k2)
(define-key X-map (kbd "3") 'k3)
(define-key X-map (kbd "hi") 'highlight-regexp)
(define-key X-map (kbd "h") 'lx-note-to-html)
(define-key X-map (kbd "<") 'pre)
(define-key X-map (kbd ">") 'ff)
(define-key X-map (kbd "*") '**)
(define-key X-map (kbd "-") '**_)
(define-key X-map (kbd "/") '**-)
(define-key X-map (kbd "{") 'img)
(define-key X-map (kbd "r") 'h_ref)
(define-key X-map (kbd "u") 'unscroll)
;;(define-key  (kbd "C-c i") 'lx-insert-file-names)
(global-set-key (kbd "C-c i") 'lx-insert-file-names)
(global-set-key (kbd "C-c n") 'lx-copy-file-names)
(global-set-key (kbd "C-c d") 'lx-copy-path)
(global-set-key (kbd "C-c y") 'lx-paste-clipboard-image-into)
;;===========================================================别名
(defalias 'qrr 'query-replace-regexp)
;;(global-hi-lock-mode 1)
;;==========================================================package
(require 'package)
;; (add-to-list 'package-archives
;;   '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;;(string= "aa" "aa")
(let ((base "~/.emacs.d/elpa"))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (if (not (string= f "archives"))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name) 
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name))))))


(require 'lx-packages)


;; Set your own keyboard shortcuts to reload/save/switch WG: 
;(global-set-key (kbd "<pause>")     'wg-reload-session)
;(global-set-key (kbd "C-S-<pause>") 'wg-save-session)
;(global-set-key (kbd "s-z")         'wg-switch-to-workgroup)
;(global-set-key (kbd "s-/")         'wg-switch-to-previous-workgroup)
;(workgroups-mode 1)  ; put this one at the bottom of .emacs
;;============================================================
(add-hook 'org-mode-hook
	  '(lambda()
	     ;(set-buffer-file-coding-system 'utf-8)
	      ;(revert-buffer-with-coding-system 'utf-8 t)
	     (lx-syn-on)
		(message ">>>> lx syntax on for org mode!")
		)
	  
		)
(setq auto-mode-alist (cons '("\\.note.*$" . org-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.g$" . ruby-mode) auto-mode-alist))
;;(switch-to-buffer "hello lx")
(message "Emacs LX is on !")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "d:/Green_Soft/emacs-24.5/bin/.emacs.d/.emacs.bmk")
 '(dired-filter-group-saved-groups
   (quote
    (("default")
     ("lx"
      ("htm"
       (extension "htm" "html"))
      ("png"
       (extension . "png"))
      ("pdf"
       (extension . "pdf"))
      ("el"
       (extension . "el"))))))
 '(diredp-image-preview-in-tooltip 150)
 '(inhibit-startup-screen t)
 '(insert-time-format "%T"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-rainbow-html-face ((t (:foreground "dark green")))))
