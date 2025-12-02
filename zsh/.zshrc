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

LS_FORMATTER="awk '
function switch_owner_and_size(formatted_listing)
{
    split(formatted_listing, a, FS, seps);
    temp=a[3];
    a[3]=a[4];
    a[4]=temp;
    leftover=\"\";
    for (i=1;i<=NF;i++)
        switch (i)
        {
            case 1:
                printf(\"%s \", a[i]);
                break;
            case 2:
                printf(\"\");
                break;
            case 3:
                if(length(seps[i])>4)
                {
                    leftover=substr(seps[i], 1, length(seps[i])-4);
                    printf(\"%s%s \", substr(seps[i], 1, 4), a[i]);
                }
                else
                {
                    printf(\"%s%s \", seps[i], a[i]);
                }
                break;
            case 4:
                printf(\"%s%s%s\", a[i], seps[i], leftover);
                break;
            default:
                printf(\"%s%s\", a[i], seps[i]);
                break;
        }
    print \"\"
}
{
    listing=\$0;
    gsub(/\033\[[0-9;]*m/,\"\",\$0);
    if(\$1~ /^[dl]/ && \$5~ /^[0-9]/)
    {
        s=length(\$4);
        sub(\$4,sprintf(\"%*s\",s-1,\"\")\"-\",listing);
        switch_owner_and_size(listing)
    }
    else
    {
        switch_owner_and_size(listing)
    }
}'"

UPDATE_SCRIPT="
echo -e \"\\n:: $(tput bold)Checking for updates in the official Arch repos and the AUR...$(tput sgr0)\\n\"
yay
echo -e \"\\n:: $(tput bold)Checking for updates in the Snap repos...$(tput sgr0)\\n\"
sudo snap refresh
"

LS_FLAGS="-lAhtrpG --color=always --time-style='+%_d %b %H:%M' --group-directories-first"

alias lsnf="'ls' $LS_FLAGS"
alias ls="ls $LS_FLAGS | $LS_FORMATTER"
alias fzf='fzf -m --preview="bat --color=always {}"'
alias clear="clear && printf '\n%.0s' {1..$LINES}"
alias grep="grep --color=always"
alias vim="nvim"
alias adbrr="adb shell settings put secure oplus_customize_screen_refresh_rate 0 && adb shell settings put system peak_refresh_rate 1 && adb shell settings put system min_refresh_ rate 1 && adb shell settings put system user_refresh_ rate 1"
alias symfony="/usr/bin/symfony"
alias update="$UPDATE_SCRIPT"

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
