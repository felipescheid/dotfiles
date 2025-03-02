# ======================================================================
#                                  PATH
# ======================================================================

export PATH="$PATH:/opt/homebrew/bin/"

export PATH=/Users/felipe/.nimble/bin:$PATH

# Postgres config
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Golang config
export PATH="$PATH:$HOME/go/bin"

# Ghostty config path
export XDG_HOME_CONFIG="$HOME/.config"

# ======================================================================
#                           APPLICATION CONFIG
# ======================================================================

# Node.js version manager config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python version manager config
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Fuzzy finder config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
## use ripgrep as default search tool for fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/" --glob "!_build/"'

# ======================================================================
#                                ALIASES
# ======================================================================

# configure universal ctags (macos uses default non-maintained ctags)
alias ctags='/opt/homebrew/bin/ctags'

alias ll='ls -alhF'

# confirm before executing irreversible actions
# to execute raw command (no alias), add \ before command name
alias cp='cp -i -v'
alias mv='mv -i -v'
alias rm='rm -i -v'

# common git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# create a dotfiles repo that can be accessed from any folder in the system
# ref: https://mitxela.com/projects/dotfiles_management
alias dotfiles='git --git-dir=/Users/felipe/.dotfiles/.git --work-tree=/Users/felipe'
alias dtig='GIT_DIR=/Users/felipe/.dotfiles/.git GIT_WORK_TREE=/Users/felipe tig'

dot() {
	if [[ "$#" -eq 0 ]]; then
		(cd /Users/felipe
		for i in $(dotfiles ls-files); do
			echo -n "$(dotfiles -c color.status=always status $i -s | sed "s#$i##")"
			echo -e "¬/$i¬\e[0;33m$(dotfiles -c color.ui=always log -1 --format="%s" -- $i)\e[0m"
		done
	) | column -t -s¬ 
else
dotfiles $*
	fi
}

# ======================================================================
#                         DISPLAY CONFIGURATION
# ======================================================================

# show git branch info in terminal
parse_git_branch() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

# Colors for IC-ORANGE-PPL theme for ghostty
# see more details here
# https://github.com/AvinashReddy3108/Gogh4Termux/blob/master/ic-orange-ppl.properties
COLOR_DEF=$'%f'
COLOR_USR=$'%F{#FC5E00}'
COLOR_DIR=$'%F{#FFE36E}'
COLOR_GIT=$'%F{#F79500}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} %F{#F6FF40}> '

# prompt color
zle_highlight=(default:fg=#F6FF40)

# ======================================================================
#                            HELPER FUNCTIONS
# ======================================================================

# utility function to convert UNIX timestamp in milliseconds to date/time
when() {
	date -r $(expr $* / 1000)
}

# create a directory and CD into it
mkcd() {
	mkdir -p "$1" && cd "$1"
}

# edit vim config
virc() {
	vi ~/.vimrc
}

# edit nvim config
nvc() {
	nvim ~/.config/nvim/init.lua
}

# edit zsh config
zshc() {
	nvim ~/.zshrc
}

