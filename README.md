If you're looking for clarity, you may have come to the wrong place.

This readme isn't for you. It's just a landing page with notes for me.

## TODOS

- change update script to highlight notable packages (see TODO in update script)
- make a function in neovim config to make it simpler to set a window-scoped property across all windows
- make all the setup scripts idempotent
- add a usage target to the makefile
- figure out what to do with intellij installs
  - I install intellij with a non-flatpak installation because it needs to be aware of other dev tools on the PATH, JREs, etc etc
  - this can be tricky because as far as I can tell, the bin scripts for intellij REALLY want to be in specific locations relative to the rest of the install files
  - maybe use selfman and make the install script something that creates a symlink(s) with an absolute path to the bins? or library it and add the library-ed bin paths to the PATH?
