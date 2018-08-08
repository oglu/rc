# Path to your oh-my-zsh configuration.


UNAME=`uname`

# zsh options
setopt inc_append_history

# variables
ZSH=~/.oh-my-zsh

# oh-my-zsh configs
plugins=(git pyenv git-extras git-flow npm per-directory-history osx tmux)
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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/oglu/projects/pgman/client/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/oglu/projects/pgman/client/node_modules/tabtab/.completions/electron-forge.zsh

