#grep
alias grep 'grep -i --color=auto'
alias fgrep 'fgrep --color=auto'
alias egrep 'egrep --color=auto'


alias alert 'notify-send --urgency=low \
    -i (test $status -eq 0; and echo terminal; or echo error) \
    (history | tail -n1)'

alias ls 'eza --icons always'
alias l 'eza -lagh --all --git --group-directories-first'
alias la "eza -lagh --git --icons --group-directories-first --sort modified"
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'

alias icat 'kitten icat'
alias ts 'trans -s ru -t en'
alias copy 'xclip -selection clipboard'
alias sleeps 'systemctl suspend -i'
