# Do setup here that is OS-independent

# Install global pip packages
pip install \
  virtualenvwrapper

source virtualenvwrapper.sh

# Set up virtual environment
export WORKON_HOME=~/venv
mkdir -p $WORKON_HOME
# Only create if it doesn't exist
if [ ! -d $WORKON_HOME/3 ]; then
  mkvirtualenv -p python3 3
  workon 3
  pip install -r ~/zeus/setup/requirements.txt
  deactivate
fi
if [ ! -d $WORKON_HOME/2 ]; then
  mkvirtualenv -p python2 2
  workon 2
  pip install -r ~/zeus/setup/requirements.txt
  deactivate
fi

# Set up my directory structure
mkdir -p projects
