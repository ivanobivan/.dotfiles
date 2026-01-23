set -gx EDITOR nvim
set -gx VISUAL nvim
set -U fish_greeting '🐟 ready'

### PATH
fish_add_path /opt/nvim-linux-x86_64/bin
fish_add_path ~/.local/bin

### History behavior
# Fish already ignores leading-space commands by default
set -g fish_history fish
set -g fish_history_limit 2000

### Load extra aliases and functions
if test -f ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
end

# fnm
set FNM_PATH "$NOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]
    set PATH "$FNM_PATH" $PATH
    fnm env | source
end
