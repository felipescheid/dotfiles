export PATH="$PATH:/opt/homebrew/bin/"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export SATURN_DEV_DB_PORT=8006
export EUROPA_DEV_DB_PORT=8061
alias hasura='hasura --skip-update-check'
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# confirm before executing irreversible actions
# to execute raw command (no alias), add \ before command name
alias cp='cp -i -v'
alias mv='mv -i -v'
alias rm='rm -i -v'

# create a dotfiles repo that can be accessed from any folder in the system
# ref: https://mitxela.com/projects/dotfiles_management

alias dotfiles='git --git-dir=/Users/felipe/.dotfiles/.git --work-tree=/Users/felipe'
