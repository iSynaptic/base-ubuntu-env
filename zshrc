export ZSH=/home/vagrant/.oh-my-zsh
export LANG=en_US.utf8

ZSH_THEME="bullet-train"
export BULLETTRAIN_PROMPT_ORDER=(time status custom context dir perl ruby virtualenv nvm aws go git cmd_exec_time)
export BULLETTRAIN_STATUS_EXIT_SHOW=true

DEFAULT_USER=vagrant

mkdir -p /vagrant/profile/$USER/

export HISTSIZE=4000
export HISTFILE=/vagrant/profile/$USER/.zsh_history
export SAVEHIST=4000

unsetopt HIST_SAVE_BY_COPY
setopt HIST_FCNTL_LOCK
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt HIST_VERIFY

export VISUAL=nano
export EDITOR=nano

plugins=(git)

if [ -f ~/.zshrc.user ]; then
  source ~/.zshrc.user
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

eval "old_$(declare -f prompt_git)"

prompt_git() {
    if ! $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        return
    fi
    
    if [[ "$(command git config --get zsh-user.exclude-git-status)" == "1" ]]; then
        return
    fi

    old_prompt_git
}

if whence -w afterOhMyZshLoad >> /dev/null; then
  afterOhMyZshLoad
fi