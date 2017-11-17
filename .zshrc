# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
bindkey -e
export WINEDEBUG=-all
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "$key[Home]"    ]] && bindkey -- "$key[Home]"    beginning-of-line
[[ -n "$key[End]"     ]] && bindkey -- "$key[End]"     end-of-line
[[ -n "$key[Insert]"  ]] && bindkey -- "$key[Insert]"  overwrite-mode
[[ -n "$key[Delete]"  ]] && bindkey -- "$key[Delete]"  delete-char
[[ -n "$key[Left]"    ]] && bindkey -- "$key[Left]"    backward-char
[[ -n "$key[Right]"   ]] && bindkey -- "$key[Right]"   forward-char

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"      ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]"    ]] && bindkey -- "$key[Down]" down-line-or-beginning-search
# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

plugins=(git last-working-dir autopep8 systemd  zsh-syntax-highlighting)

PROMPT="%F{green}%n@%m %# %F{white}"
#PROMPT="[%n@%m:%/]%#"
preexec () { echo -ne "\e[0m" }

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/usr/local/texlive/2012/bin/x86_64-linux
export EDITOR=/usr/bin/vim
alias vim="vim -S ~/.vimrc"
source /etc/profile.d/perlbin.sh
source /etc/profile.d/locale.sh
source /etc/profile.d/vte.sh
source /etc/profile.d/gpm.sh

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jai/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
