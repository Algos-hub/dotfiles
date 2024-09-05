if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	repeat $LINES print
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(fzf --zsh)"

alias fzf='fzf -m --preview="bat --color=always {}"'
alias clear="clear && printf '\n%.0s' {1..$LINES}"
alias ls="ls -latrG --color=always"
alias grep="grep --color=always"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LANG=en_US.UTF-8
. "$HOME/.cargo/env"
fpath+=${ZDOTDIR:-~}/.zsh_functions
