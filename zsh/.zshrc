# Path to your oh-my-zsh configuration.

# PATHS
export PATH=/usr/local/bin:$PATH:~/.local/bin
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH=$PATH:~/local/bin
export PATH=$PATH:~/local/go/bin
export PATH=$PATH:node_modules/.bin
export PATH=$PATH:~/local/go_appengine

export GOPATH=~/go/:~/projects/go/
export PATH=$PATH:~/go/bin:~/projects/go/bin

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

UNAME=`uname`
if [ "$UNAME" = "Darwin" ]; then
    export PATH=$PATH:/opt/local/bin
fi


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

# exported variables
#export VIRTUAL_ENV_DISABLE_PROMPT=1


# call external scripts
source $ZSH/oh-my-zsh.sh
#source  /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

#aliases
alias sdocker='sudo docker'


PATH=~/npm/bin/:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
NODE_PATH=$NODE_PATH:/home/oglu/npm/lib/node_modules

export NVM_DIR="/Users/oglu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# The next line updates PATH for the Google Cloud SDK.
source '/Users/oglu/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/oglu/google-cloud-sdk/completion.zsh.inc'
