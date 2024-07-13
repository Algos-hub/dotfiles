eval "$(fzf --zsh)"

alias fzf='fzf -m --preview="bat --color=always {}"'
alias clear="clear && printf '\n%.0s' {1..$LINES}"
alias ls="ls -laG"
alias grep="grep --color=always"
