[[ $TTY = "/dev/tty1" ]] && (( $UID )) && [[ -z $DISPLAY ]] && exec startx

HISTFILE=~/.histfile
HISTSIZE=65536
SAVEHIST=65536
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep

bindkey -e

zstyle :compinstall filename '/home/anthony/.zshrc'
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

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
export BROWSER=firefox
export USE_CCACHE=1
# export PYTHONPATH=/usr/lib/python2.7/site-packages
export WORKON_HOME=~/Envs
export PATH=~/bin:~/.cargo/bin:~/.cabal/bin:$PATH
export RUST_SRC_PATH=~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/
export SSH_AUTH_SOCK=/run/user/1000/gnupg/S.gpg-agent.ssh

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

export WORDCHARS=''

autoload -U colors && colors
#autoload -U promptinit && promptinit
autoload -Uz compinit && compinit

# source /etc/environment
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
powerline-daemon -q
source /usr/bin/virtualenvwrapper.sh
source ~/.shell_aliases

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--extended --exact --multi --inline-info --prompt="fzf> "'

eval `opam config env`
