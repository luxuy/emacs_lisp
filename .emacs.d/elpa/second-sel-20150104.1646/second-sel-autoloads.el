;;; second-sel-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "second-sel" "second-sel.el" (22075 7761 0
;;;;;;  0))
;;; Generated autoloads from second-sel.el

(defvar secondary-selection-ring-max 60 "\
*Maximum length of `secondary-selection-ring'.
After the ring is maximally filled, adding a new element replaces the
oldest element.")

(custom-autoload 'secondary-selection-ring-max "second-sel" t)

(defvar secondary-selection-yank-commands (if (boundp 'browse-kill-ring-yank-commands) browse-kill-ring-yank-commands '(yank icicle-yank-maybe-completing)) "\
*Commands that `yank-pop-commands' recognizes as yanking text.")

(custom-autoload 'secondary-selection-yank-commands "second-sel" t)

(defvar secondary-selection-yank-secondary-commands '(mouse-yank-secondary secondary-dwim yank-secondary) "\
*Commands that yank the secondary selection.")

(custom-autoload 'secondary-selection-yank-secondary-commands "second-sel" t)

(autoload 'secondary-dwim "second-sel" "\
Do-What-I-Mean with the secondary selection.
Prefix arg:

 None: Yank secondary.
 Zero: Select secondary as region.
 > 0:  Move secondary to region.
 < 0:  Swap region and secondary.

Details:

No prefix arg: Yank the secondary selection at point.  Move point to
the end of the inserted text.  Leave mark where it was.

Zero arg: Select the secondary selection and pop to its buffer.

Non-zero arg: Move the secondary selection to this buffer's region.

Negative arg: Also go to where the secondary selection was and select
it as the region.  That is, swap the region and the secondary
selection.

\(fn ARG)" t nil)

(autoload 'yank-secondary "second-sel" "\
Insert the secondary selection at point.
Moves point to the end of the inserted text.  Does not change mark.

Numeric prefix arg N means insert the Nth most recently yanked
secondary selection.  Plain `C-u' is the same as N=1.

You can also use `M-y' after this command to yank previous secondary
selections.  With no prefix arg, this always yanks the active
secondary selection (the one that is highlighted), not the last
selection yanked.

\(fn &optional ARG)" t nil)

(autoload 'isearch-yank-secondary "second-sel" "\
Yank string from secondary-selection ring into search string.

\(fn)" t nil)

(autoload 'primary-to-secondary "second-sel" "\
Make the region in the current buffer into the secondary selection.
Deactivate the region.  Do not move the cursor.

\(fn BEG END)" t nil)

(autoload 'secondary-swap-region "second-sel" "\
Make the region into the secondary selection, and vice versa.
Pop to the buffer that has the secondary selection, and change it to
the region.  Leave behind the secondary selection in place of the
original buffer's region.

\(fn BEG END)" t nil)

(autoload 'secondary-to-primary "second-sel" "\
Convert the secondary selection into the active region.
Select the secondary selection and pop to its buffer.

\(fn)" t nil)

(autoload 'yank-pop-commands "second-sel" "\
`yank-pop' or `yank-pop-secondary', depending on previous command.
If previous command was a yank-secondary command, then
   `yank-pop-secondary'.
Else if previous command was a yank command, then `yank-pop'.
Else if `browse-kill-ring' is defined, then `browse-kill-ring'.
 If in a `browse-kill-ring' selection-ring buffer, then browse the
  other selection ring.
Suggestion: Bind this command to `M-y'.

\(fn &optional ARG)" t nil)

(autoload 'yank-pop-secondary "second-sel" "\
Replace just-yanked secondary selection with a different one.
You can use this only immediately after a `yank-secondary' or a
`yank-pop-secondary'.

At such a time, the region contains a stretch of reinserted
previously-killed text.  `yank-pop-secondary' deletes that text and
inserts in its place a different stretch of killed text.

With no prefix argument, inserts the previous secondary selection.
With argument N, inserts the Nth previous (or Nth next, if negative).
The ring of secondary selections wraps around.

This command honors `yank-excluded-properties' and `yank-handler'.

\(fn &optional ARG)" t nil)

(autoload 'rotate-secondary-selection-yank-pointer "second-sel" "\
Rotate the yanking point in the secondary selection ring.
With prefix arg, rotate that many kills forward or backward.

\(fn ARG)" t nil)

(autoload 'mouse-save-then-kill-delete-region "second-sel" "\
Delete text from BEG to END.  Put text on undo list, sharing with RING.
RING defaults to `kill-ring'.

\(fn BEG END &optional RING)" nil nil)

(autoload 'set-secondary-start "second-sel" "\
Set start of the secondary selection at point.
Interactively, or with non-nil optional arg MSGP, display a message.

\(fn &optional MSGP)" t nil)

(autoload 'mouse-secondary-save-then-kill "second-sel" "\
Set or delete the secondary selection according to CLICK.
Add the updated secondary selection to `secondary-selection-ring'.
CLICK should be a mouse click event.
Interactively, or with non-nil optional arg MSGP, display a message.

If the secondary selection already exists in the clicked buffer,
extend or retract the end that is closest to the CLICK position to
that position.  But if you have set the selection start position by
double- or triple-clicking, then extend or retract to the nearest word
or line boundary instead of exactly to the CLICK position.

If there is no secondary selection in the clicked buffer, but you have
used `\\[mouse-start-secondary]' or `\\[set-secondary-start]' there to define the start
position, set the secondary selection between the CLICK position and
that start position.

Invoking this command (or `\\[secondary-save-then-kill]') in the same location
immediately after invoking it (or `\\[secondary-save-then-kill]') there deletes the
text of the secondary selection.

In all cases, add the selected text to `secondary-selection-ring', or
if it is already at the start of that ring, update it there.

\(fn CLICK &optional MSGP)" t nil)

(autoload 'secondary-save-then-kill "second-sel" "\
Same as `mouse-secondary-save-then-kill', but invoked without the mouse.
POSITION (point, if interactive) plays the click-position role.
Interactively, or with non-nil optional arg MSGP, display a message.

\(fn &optional POSITION MSGP)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; second-sel-autoloads.el ends here
