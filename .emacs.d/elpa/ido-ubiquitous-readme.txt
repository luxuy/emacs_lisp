If you use the excellent `ido-mode' for efficient completion of
file names and buffers, you might wonder if you can get ido-style
completion everywhere else too. Well, that's what this package
does! ido-ubiquitous is here to enable ido-style completion for
(almost) every function that uses the standard completion function
`completing-read'.

To use this package, call `ido-ubiquitous-mode' to enable the mode,
or use `M-x customize-variable ido-ubiquitous-mode' it to enable it
permanently. Once the mode is enabled, most functions that use
`completing-read' will now have ido completion. If you decide in
the middle of a command that you would rather not use ido, just C-f
or C-b at the end/beginning of the input to fall back to non-ido
completion (this is the same shortcut as when using ido for buffers
or files).

Note that `completing-read' has some quirks and complex behavior
that ido cannot emulate. Ido-ubiquitous attempts to detect some of
these quirks and avoid using ido when it sees them. So some
functions will not have ido completion even when this mode is
enabled. Some other functions have ido disabled in them because
their packages already provide support for ido via other means (for
example, org-mode and magit). See `M-x customize-group
ido-ubiquitous' and read about the override variables for more
information.

ido-ubiquitous version 3.0 is a major update, including a split
into two packages, and some of the configuration options have
changed in non-backwards-compatible ways. If you have customized
ido-ubiquitous, be sure to check out `M-x customize-group
ido-ubiquitous' and `M-x customize-group ido-completing-read+'
after updating to 3.0 and make sure the new settings are to your
liking.



This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
