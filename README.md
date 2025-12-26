If you're looking for clarity, you may have come to the wrong place.

This readme isn't for you. It's just a landing page with notes for me.

## TODOS

- create a jujutsu version of "fshow" using fzf
- change update script to highlight notable packages (see TODO in update script)
- make a function in neovim config to make it simpler to set a window-scoped property across all windows
- make all the setup scripts idempotent
- add setup scripts to machine make goals for easy take-in after initial setup
- add a usage target to the makefile
- figure out what to do with `/mine/programs`, which will require figuring out what to do with:
  - sdkman (probably just update the sdkman dir to ~/.local/share/sdkman" and call it a day)
  - intellij (non flatpak because you probably want it to integrate with the rest of your dev tools, this one might be trickier because as far as I can tell the bin scripts really want to be in specific locations relative to the rest of the install files... maybe selfman and the install script is creating a symlink(s) with an absolute path to the bins? or library it and add the library-ed bin paths to the PATH...)
