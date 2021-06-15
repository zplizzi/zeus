# My general .bashrc file. Only include things here that should work on all Unix-like systems.

# set up virtualenvwrapper path
export WORKON_HOME=~/venv

source virtualenvwrapper.sh

# activate virtual environment
workon 3

#### RANDOM FUNCTIONS #####
# awesome!  CD AND LA. I never use 'cd' anymore...
function cl(){ cd "$@" && la; }
# Two standard functions to change $PATH
add_path() { export PATH="$PATH:$1"; }
add_pre_path() { export PATH="$1:$PATH"; }


# Create a nice looking bash prompt

# Colors
RED='\[\033[31m\]'
GREEN='\[\033[32m\]'
YELLOW='\[\033[33m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'
WHITE='\[\033[37m\]'
NIL='\[\033[00m\]'


# Get Virtual Env
if [[ $VIRTUAL_ENV != "" ]]
    then
      # Strip out the path and just leave the env name
      venv="${YELLOW}(${VIRTUAL_ENV##*/})"
else
      # In case you don't have one activated
      venv=''
fi

# Set bash prompt
export PS1="${venv}${PURPLE} \w$ ${NIL}"


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then  
  eval "$(pyenv init -)"
fi

