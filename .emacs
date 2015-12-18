;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LX's .emacs file
;;; Last modified time
;;; Time-stamp: <2015-11-05>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "Liu Xiang")
(setq user-mail-address "ulganix@126.com")



;;======================================================================·������

;;
;;���غͱ༭.emacs
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

(setq bookmark-default-file "~/.emacs.d/.emacs.bmk");��ǩ�ļ�
;(org-mode t)
;;(setq initial-major-mode (quote org-mode))



;;========================================================================Emacs����
(setq make-backup-files nil) ;��������׺Ϊ"~"�ı����ļ�
;;(setq backup-directory-alist (quote (("." . "~/.backups")))) ;�����ļ���λ
;;=======

  

;;==========================================================

(setq default-major-mode 'text-mode)  
;;(add-hook 'text-mode-hook 'turn-on-auto-fill)  
;;����ȱʡ��ģʽ��text��,������auto-fill��ģʽ.�����ǻ���ģʽfundamental-mode  
(setq visible-bell t) ;�رճ�����ʾ��
(setq inhibit-startup-message t) ;�ر���������
(setq column-number-mode t) ;��ʾ�к�
(setq mouse-yank-at-point t);��Ҫ������м�������Ǹ��ط�������������ݣ������ڹ�괦��
(setq kill-ring-max 200);���л����ֵ
(setq frame-title-format "%f");��������ʾbuffer name
(auto-image-file-mode);ֱ����ʾͼƬ
(setq highlight-nonselected-windows t);�ǵ�ǰ���ڵ�regionҲ������ʾ
(show-paren-mode t)
(setq show-paren-style 'parentheses);�ر���������
(setq enable-recursive-minibuffers t);�ݹ�ʹ��minibuffer
(setq resize-mini-windows t);minibuffer�Զ��������
(setq scroll-margin 3 scroll-conservatively 10000);��ֹҳ�����ʱ����
(global-linum-mode 1);��ʾ�к�
;;(global-hl-line-mode 1);������ǰ��
(menu-bar-no-scroll-bar);ȥ��������
(tool-bar-mode -1);ȥ��ͼ��
;;�����ʾΪһ����  
(setq-default cursor-type 'bar)  
;;������ʾͼƬ  
(auto-image-file-mode t)  

(setq-default line-spacing 5);�޸�Ĭ���о࣬��ʾ���ĺÿ�
;;(cua-mode t);����cua mode
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

(blink-cursor-mode -1);���ù����˸
(fset 'yes-or-no-p 'y-or-n-p);;���е�������y/n��ʽ������yes/no��ʽ���е�����ֻ������һ����ĸ
;;(mouse-avoidance-mode 'animate);����Զ��ܿ�ָ��

(global-visual-line-mode t);��������ģʽ���Զ�����
(setq display-time-format "%Y��%m��%d�� %A %H:%M");��ʾʱ��ĸ�ʽ
(display-time-mode 1)
(setq display-time-interval 10);ʱ��ı仯Ƶ��
(setq display-time-24hr-format t);ʱ��ʹ��24Сʱ��
(setq display-time-day-and-date t);ʱ����ʾ�������ں;���ʱ��
(when window-system (set-frame-size (selected-frame) 150 62));���ô��ڳߴ�
(when window-system (set-frame-position (selected-frame) 400 0));���ô���λ��
;;(hs-minor-mode t)  
;;IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;;ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;============================================================�Զ���ȫ
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-l
      '(
	    ;senator-try-expand-semantic ;���ȵ�����senator�ķ������-����-����ʹ�ð�
	try-expand-line ; ��ȫ��ǰ��
	try-expand-line-all-buffers
	try-expand-list ; ��ȫһ���б�
	try-expand-list-all-buffers
	try-expand-dabbrev ; ������ǰ buffer
	try-expand-dabbrev-visible ; ������ǰ�ɼ�����
	try-expand-dabbrev-all-buffers ; �������� buffer
	try-expand-dabbrev-from-kill ; �� kill-ring ������
	try-complete-file-name ; �ļ���ƥ��
	try-complete-file-name-partially ; �ļ�������ƥ��
	try-complete-lisp-symbol ; ��ȫ lisp symbol
	try-complete-lisp-symbol-partially ; ���ֲ�ȫ elisp symbol
	try-expand-whole-kill
	)
      )
;;=======================================����minbuffer
(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(global-set-key "\C-co" 'switch-to-minibuffer) ;; Bind to `C-c o'




;;=====================================**load**=====���ز��
;;; Smex
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-M-y") 'secondary-dwim)
;;ʹ�÷��������磺lxfwd �Զ�ƥ��lx-select-forword,�����м���ַ���C-s,C-rǰ��enterѡ����

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

;;=====================================��������
;; Setting English Font
;;(set-face-attribute 'default nil :font "Consolas 12")
;(require 'unicad)
;----��������
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
                    charset (font-spec :family "����"
                                       )))




;;=====================================��ݼ�
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
;;(set-mouse-position frame x y) x y���ַ�����
;;The arguments x and y are integers, giving the position in characters relative to the top left corner of the inside of frame
  (other-frame -1))
(global-set-key (kbd "<M-wheel-up>") 'lx-next-frame)

(defun lx-previous-win() ;;���Ʋ�����window,���ڲ�������ͻ
  "Switch to previous window."
  (interactive)
  (other-window 1))

(global-set-key (kbd "<S-wheel-down>") 'lx-previous-win)
(defun lx-next-win()
  "Switch to next window."
  (interactive)
  (other-window -1))

(global-set-key (kbd "<S-wheel-up>") 'lx-next-win)
;;==========================�Զ�������
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
;;===========================================================����
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
