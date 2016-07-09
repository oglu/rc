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

source .base_bash_profile
