# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="kphoen"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git brew extract z)

# User configuration
source $ZSH/oh-my-zsh.sh

# Git aliases

# These are all already in the git plugin. Here for quick reference.
#alias ga="git add"
#alias gaa="git add -all"
#alias gc="git commit"
#alias gcmsg="git commit -m"
#alias gca="git commit -a"
#alias gcam="git commit -am"
#alias gd="git diff"
#alias gst="git status"
#alias gco="git checkout"
#alias gcm="git checkout master"
#alias gcb="git checkout -b"

alias yolo="git commit -m 'no message specified'"
alias yoloo="git commit -m 'no message specified' && git push"
alias yolooo="git add -A && git commit -m 'no message specified' && git push"

export EDITOR="vim";

# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

# activate virtual environment
#source virtualenvwrapper.sh
#export WORKON_HOME=~/venv
#workon 3 

# Don't share history between different instances
unsetopt share_history

# Konsole fix: enable 256 color support
export TERM=xterm-256color

# Fix TMUX issue where you can't deactivate the virtualenv
# The problem is that TMUX imports env vars from the launching shell, and
# then has a system to merge in session vars with the global vars.
#alias tmux="deactivate && tmux"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then  
  eval "$(pyenv init -)"
fi

