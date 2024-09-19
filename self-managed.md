# Self-managing source-built programs

There are some utilities (mostly written by me, but other use cases come up from time to time) that I need to build from source. Managing these manually & individually is a pain.

This is the kind of thing a package manager is supposed to be good for, and I probably don't want to implement my own whole damn pacakge manager. But we can probably cover my needs with a few scripts and a few well-followed conventions.

### Directory structure

```
mine
  - programs
    - bin
    - self-managed
      - [name (each)]
        - source (can be symlink)
          [ git repo, source bundle, scratch space, whatever ]
        - actions
          - update.sh
          - build.sh
          - put-bin.sh
          - status.sh
            [ this simply reports version numbers, this isn't like "git fetch and report differences" ]
```

### Scripts

- setup all (initial setup for all projects)
  - this could copy some reasonable defaults for the action scripts
- update all
- get statuses

Special: should probably add a make target to my config repo that creates the full directory skeleton I need
