# Path to your oh-my-zsh configuration.

UNAME=`uname`

# zsh options
setopt inc_append_history

# variables
ZSH=~/.oh-my-zsh
WORKON_HOME=~/envs
IPYTHONDIR=~/.ipython

# oh-my-zsh configs
plugins=(git mercurial git-extras git-flow npm per-directory-history virtualenvwrapper osx brew tmux)
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# call external scripts
source $ZSH/oh-my-zsh.sh

#aliases
alias sdocker='sudo docker'

if [[ $SSH_CONNECTION ]]; then
    export PROMPT="[%{$bg[red]%}%{$fg[white]%}%m%{$reset_color%]]${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info) "
fi
