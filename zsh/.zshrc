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

setopt correct

# There has to be a better way to do this without installing a third party ls replacement...
SED_FORMAT="sed -E '2,\$s/ +[0-9]+//'"

AWK_FORMAT="awk '
{
    _=\$0;
    gsub(/\033\[[0-9;]*m/,\"\",\$0);
    if(\$1~ /^[dl]/ && \$5~ /^[0-9]/)
    {
        s=length(\$4);
        sub(\$4,sprintf(\"%*s\",s-1,\"\")\"-\",_);
        print _
    }
    else
    {
        print _
    }
}'"

AWK_FORMAT_FIX="awk '
{
    split(\$0, a, FS, seps);
    temp=a[2];
    a[2]=a[3];
    a[3]=temp;
    for (i=1;i<=NF;i++)
        if(i==2)
        {
            if(length(seps[i])>4)
            {
                printf(\"%s%s%s \", substr(seps[i], 1, 4), a[i], substr(seps[i], 1, seps[i]-4));
            }
            else
            {
                printf(\"%s%s \", seps[i], a[i]);
            }
        }
        else
        {
        printf(\"%s%s\", a[i], seps[i]);
        }
    print \"\"
}'"

alias ls="ls -lAhtrpG --color=always --time-style='+%_d %b %H:%M' | $AWK_FORMAT | $SED_FORMAT | $AWK_FORMAT_FIX"
alias fzf='fzf -m --preview="bat --color=always {}"'
alias clear="clear && printf '\n%.0s' {1..$LINES}"
alias grep="grep --color=always"
alias vim="nvim"
alias adbrr="adb shell settings put secure oplus_customize_screen_refresh_rate 0 && adb shell settings put system peak_refresh_rate 1 && adb shell settings put system min_refresh_ rate 1 && adb shell settings put system user_refresh_ rate 1"
alias symfony="/usr/bin/symfony"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LANG=en_US.UTF-8
. "$HOME/.cargo/env"
fpath+=${ZDOTDIR:-~}/.zsh_functions
export PATH="$HOME/.symfony5/bin:$PATH"
export PATH="$HOME/.local/share/applications:$PATH"
export PATH="$HOME/Desktop:$PATH"
export PATH="/opt/android-studio/bin:$PATH"
export PATH="$(composer config -g home)/vendor/bin:$PATH"
