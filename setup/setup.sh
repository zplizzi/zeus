# Do setup here that is OS-independent

# Install global pip packages
pip install \
  virtualenvwrapper

source virtualenvwrapper.sh

# Set up virtual environment
export WORKON_HOME=~/venv
mkdir -p $WORKON_HOME
# Only create if it doesn't exist
if [ ! -d $WORKON_HOME/3.4 ]; then
  mkvirtualenv -p python3.4 3.4
  workon 3.4
  pip install -r requirements.txt
  deactivate
fi
if [ ! -d $WORKON_HOME/2.7 ]; then
  mkvirtualenv -p python2.7 2.7
  workon 2.7
  pip install -r requirements.txt
  deactivate
fi

# Set up my directory structure
mkdir -p projects
