# LazyVim Helpful Commands (like WebStorm)

## Navigation Buffer

`]b`, `L` - next buffer  
`[b`, `H` - previous buffer  
`<leader>, , <leader>fb` - show last files (Ctrl+e)  
`<Ctrl>o` - navigate back  
`<Ctrl>i` - navigate forward  
`]d` - next error  
`[d` - previous error

## Navigation Code

`gr` - find where variable is used  
`gd` - go to variable definition
`0` - go to line start
`$`- go to line end
`_`- go to first non-blank character
`f{char}`- find char on line forward + press ; for move next
`F{char}` - find char on line backward
`t{char}` - find char on line forward and stop before it
`T{char}` - find char on line backward and stop before it

## Text Editing

`i` - insert before cursor  
`I` - insert at beginning of line  
`a` - insert after cursor  
`A` - insert at end of line  
`s`, `S`, `c` - change/replace  
`r`, `R` - replace one or more symbols  
`x` - remove one symbol  
`yyp`, `yyP` - copy line and paste above/below

## Window Splitting

`<leader>wv` - split horizontally (Ctrl+Alt+9)  
`<leader>ww` - switch split (Alt+/)  
`<leader>wd` - close any window
`<Ctrl>l` - move left window  
`<Ctrl>h` - move right window

## Code Management

`<Alt>j` - move line down (Ctrl+Alt+Down)  
`<Alt>k` - move line up (Ctrl+Alt+Up)  
`<leader>ql` - restore last session (WS default)  
`<leader>sr` - global replace (Ctrl+Shift+R)  
`gcc` / `gc` - comment line (multiline)

## Git

`<leader>gg` - open LazyGit

## Visual mode

`<Ctrl>v` - select one line
`g<Ctrl>a` - make num sequence

## Other

`<leader>cr` - mass rename (Ctrl+F6)  
`<leader>xx` - show errors  
`<leader>ss` - show file structure (F12)  
`<leader>sg`, `<leader>sG`, `<leader>/` - mass search (Ctrl+Shift+F)
`<Ctrl>a` - increase number
`<Ctrl>x` - decrease number
`<Ctrl>o` - in visual go to normal mode to one action

## Help

`<leader>sk` - show keymaps  
`<leader>sh` - show help
