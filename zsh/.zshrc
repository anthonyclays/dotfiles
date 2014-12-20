# [[ $TTY -eq /dev/tty1 ]]
#  && (( $UID ))         \
#  && [[ -z $DISPLAY ]]  \
#  && exec startx

HISTFILE=~/.histfile
HISTSIZE=65536
SAVEHIST=65536
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep

bindkey -e

zstyle :compinstall filename '/home/anthony/.zshrc'

setopt auto_cd
setopt auto_pushd
setopt dvorak # Assume dvorak keyboard layout for correction
setopt correct
setopt braceccl
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups

export EDITOR=vim
# Use cope to auto-colorize common commands, include perl/ruby paths
export PATH=/usr/share/perl5/vendor_perl/auto/share/dist/Cope:${PATH}:/usr/bin/vendor_perl:~/bin:~/.gem/ruby/2.1.0/bin:~/perl5/bin
export USE_CCACHE=1
export PYTHONPATH=/usr/lib/python3.4/site-packages

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

# bind CTRL + left / right to word jumping
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

export WORDCHARS=''

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
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

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

autoload -U colors && colors
#autoload -U promptinit && promptinit

autoload -Uz compinit && compinit

say() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }

#source /etc/environment
source /usr/share/powerline/bindings/zsh/powerline.zsh
source ~/.shell_aliases

if [ "$TERM" = "linux" ]; then
    # dark solarized
    #setfont /usr/share/fonts/misc/ter-powerline-v16n.psf.gz
    echo -en "\e]P0073642" #black
    echo -en "\e]P1dc322f" #darkred
    echo -en "\e]P2859900" #darkgreen
    echo -en "\e]P3b58900" #brown
    echo -en "\e]P4268bd2" #darkblue
    echo -en "\e]P5d33682" #darkmagenta
    echo -en "\e]P62aa198" #darkcyan
    echo -en "\e]P7eee8d5" #lightgrey
    echo -en "\e]P8002b36" #darkgrey
    echo -en "\e]P9cb4b16" #red
    echo -en "\e]PA586e75" #green
    echo -en "\e]PB657b83" #yellow
    echo -en "\e]PC839496" #blue
    echo -en "\e]PD6c71c4" #magenta
    echo -en "\e]PE93a1a1" #cyan
    echo -en "\e]PFfdf6e3" #white
    clear #for background artifacting
fi

PERL5LIB="/home/anthony/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/anthony/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/anthony/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/anthony/perl5"; export PERL_MM_OPT;

# Setup fasd
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
alias c=fasd_cd
alias v='f -e vim'
alias m='f -e mpv --vo=opengl-hq'
alias o='a -e xdg-open'

# Fast switching between vim and shell
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
