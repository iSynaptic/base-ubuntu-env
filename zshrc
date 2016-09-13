export ZSH=/home/vagrant/.oh-my-zsh
ZSH_THEME="agnoster"

DEFAULT_USER=vagrant
cdpath=/projects

export VISUAL=nano
export EDITOR=nano

plugins=(git)
source $ZSH/oh-my-zsh.sh

function prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER@%m"
  fi
}