#!/usr/bin/r

# Select Items from a List
# Description
# Select item(s) from a character vector.

# Usage
# select.list(choices, preselect = NULL, multiple = FALSE,
#             title = NULL, graphics = getOption("menu.graphics"))
# Arguments
# choices	
# a character vector of items.

# preselect	
# a character vector, or NULL. If non-null and if the string(s) appear in the list, the item(s) are selected initially.

# multiple	
# logical: can more than one item be selected?

# title	
# optional character string for window title, or NULL for no title.

# graphics	
# logical: should a graphical widget be used?

# Details
# The normal default is graphics = TRUE.

# On Windows,
# this brings up a modal dialog box with a (scrollable) list of items, which can be selected by the mouse. If multiple is true, further items can be selected or deselected by holding the control key down whilst selecting, and shift-clicking can be used to select ranges.

# Normal termination is via the ‘OK’ button or by hitting Enter or double-clicking an item. Selection can be aborted via the ‘Cancel’ button or pressing Escape.

# Under the macOS GUI,
# this brings up a modal dialog box with a (scrollable) list of items, which can be selected by the mouse.

# On other Unix-like platforms
# it will use a Tcl/Tk listbox widget if possible.

# If graphics is FALSE or no graphical widget is available it displays a text list from which the user can choose by number(s). The multiple = FALSE case uses menu. Preselection is only supported for multiple = TRUE, where it is indicated by a "+" preceding the item.

# It is an error to use select.list in a non-interactive session.

# Value
# A character vector of selected items. If multiple is false and no item was selected (or Cancel was used), "" is returned. If multiple is true and no item was selected (or Cancel was used) then a character vector of length 0 is returned.

# See Also
# menu, tk_select.list for a graphical version using Tcl/Tk.

# Examples
## Not run: 
select.list(sort(.packages(all.available = TRUE)))

## End(Not run)