HISTFILE=~/.histfile
HISTSIZE=65536
SAVEHIST=65536
unsetopt beep

bindkey -e

zstyle :compinstall filename '/home/anthony/.zshrc'
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

setopt appendhistory autocd extendedglob nomatch notify
setopt auto_pushd
# Assume dvorak keyboard layout for correction
setopt dvorak
setopt correct
setopt braceccl
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups


export EDITOR=nvim
export PAGER=less
export BROWSER=firefox
export USE_CCACHE=1
# export PYTHONPATH=/usr/lib/python2.7/site-packages
export WORKON_HOME=~/Envs
export PATH=~/bin:~/.local/bin:~/.cargo/bin:~/.cabal/bin:$PATH
export RUST_SRC_PATH=~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/
export SSH_AUTH_SOCK=/run/user/1000/gnupg/S.gpg-agent.ssh
export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

export WORDCHARS=''

autoload -U colors && colors
#autoload -U promptinit && promptinit
autoload -Uz compinit && compinit

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
powerline-daemon -q
source ~/.shell_aliases

# Fast switching between vim and shell
fancy-ctrl-z () {
  fg
  zle push-input
  BUFFER=""
  zle accept-line
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--extended --exact --multi --inline-info --prompt="> "'

source /home/anthony/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
