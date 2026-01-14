## Navigation

- `j` or `↓` — move down the file list
- `k` or `↑` — move up the file list
- `h` — go to the parent directory
- `gg` — jump to the top of the list
- `G` — jump to the bottom of the list
- `<Ctrl>+f` — scroll down one full page
- `<Ctrl>+b` — scroll up one full page
- `J` — scroll down by half a page
- `K` — scroll up by half a page
- `H` — go back in navigation history
- `L` — go forward in navigation history

---

## Directory Shortcuts

- `gh` — change directory to home (`~/`)
- `ge` — change directory to `/etc`
- `gu` — change directory to `/usr`
- `gd` — change directory to `/dev`
- `go` — change directory to `/opt`
- `gv` — change directory to `/var`
- `gm` — change directory to `/media`
- `gM` — change directory to `/mnt`
- `gs` — change directory to `/srv`
- `gr` — change directory to root (`/`)
- `gR` — change directory to Ranger's global configuration directory

---

## File Operations

- `i` — preview file in pager (read-only mode)
- `l` or `E` — open file with default application
- `r` — open file with a chosen program
- `z` — toggle common settings
- `zh` — show or hide hidden files
- `Space` — select or toggle the current file
- `t` — tag (mark) the current file for batch operations
- `cw` — rename the current file
- `/` — start searching for files
- `n` — go to the next search match
- `N` — go to the previous search match
- `yy` — copy the selected file
- `dd` — cut (mark for moving) the selected file
- `pp` — paste copied or cut files
- `<Delete>` — delete the selected file

---

## Tabs

- `<Ctrl>+n` — create a new tab
- `<Ctrl>+w` — close the current tab
- `Tab` — switch to the next tab
- `Shift+Tab` — switch to the previous tab

---

## General Commands

- `?` — open Ranger manual
- `1?` — view key bindings
- `2?` — view command help
- `3?` — view settings help
- `R` — refresh the current directory
- `Q` — quit Ranger
- `!` — execute a shell command (e.g., `!ls -la`)
- `:` — execute a Ranger command (e.g., `:chmod +x file.sh`)
- `du` — show disk usage of the current directory
- `chmod` — change permissions of the selected file

---

## Command Flags

These can be appended after `!` (for shell commands) or `:` (for Ranger commands):

- `-s` — suppress output (run silently)
- `-d` — run in background (detached mode)
- `-p` — pipe output through Ranger’s built-in pager
- `-w` — wait and keep terminal open after command finishes
- `-c` — apply command only to the current file (not selected files)

---

## Placeholders (for batch operations)

Use in commands to represent dynamic paths:

- `%f` — current selected file
- `%d` — current directory
- `%s` — all selected files
- `%t` — all tagged files (marked with `t`)

> Example: `!cp %s /backup` — copies all selected files to `/backup`
