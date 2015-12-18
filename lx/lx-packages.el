
(require 'volatile-highlights)
(volatile-highlights-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: undo-tree                  ;;
;;                                     ;;
;; GROUP: Editing -> Undo -> Undo Tree ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'undo-tree)
(global-undo-tree-mode)
;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: ztree  ;;
;;                 ;;
;; GROUP: No group ;;
;;;;;;;;;;;;;;;;;;;;;
;; since ztree works with files and directories, let's consider it in
;; group Files
(require 'ztree-diff)
(require 'ztree-dir)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: dired+                     ;;
;;                                     ;;
;; GROUP: Files -> Dired -> Dired Plus ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'dired+)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: ido-ubiquitous                                   ;;
;;                                                           ;;
;; GROUP: Development -> Extensions -> Ido -> Ido Ubiquitous ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ido-ubiquitous)
(ido-ubiquitous-mode +1)
(setq ido-everywhere t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: flx-ido                                          ;;
;;                                                           ;;
;; GROUP: Development -> Extensions -> Ido                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; smarter fuzzy matching for ido
(require 'flx-ido)
(flx-ido-mode +1)
;; disable ido faces to see flx highlights
(setq ido-use-faces nil)
(require  'bookmark+) 
(require 'w32-browser) 
(require 'image+)
(require 'image-dired+)
(require 'dired-narrow)
(require 'dired-rainbow)
(require 'dired-details)
(dired-details-install)

(require 'second-sel)
;(require 'dired-sort-menu+)
(require 'dired-details+)
(require 'dired-filter)
(require 'help-fns+)
(require 'fold-dwim)
;(require 'workgroups2)
;; Change workgroups session file

(require 'multiple-cursors)
(require 'image-dired)
(require 'rainbow-mode) ;#000000
(require 'haskell)


(provide 'lx-packages)
