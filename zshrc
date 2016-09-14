export ZSH=/home/vagrant/.oh-my-zsh
ZSH_THEME="agnoster"

DEFAULT_USER=vagrant
cdpath=/projects

export VISUAL=nano
export EDITOR=nano

plugins=(git)

if [ -f ~/zshrc.user ]; then
  source ~/zshrc.user
fi

if whence -w beforeOhMyZshLoad >> /dev/null; then
  beforeOhMyZshLoad
fi

source $ZSH/oh-my-zsh.sh

function prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER@%m"
  fi
}

if whence -w afterOhMyZshLoad >> /dev/null; then
  afterOhMyZshLoad
fi