# Deactivate virtual environment if one is active
deactivate

# Set to quit on errors
set -e

# Install global pip packages
sudo pip install \
  virtualenvwrapper

source virtualenvwrapper.sh

# Set up virtual environment
export WORKON_HOME=~/venv
mkdir -p $WORKON_HOME
# Only create if it doesn't exist
if [ ! -d "$WORKON_HOME/3" ]; then
  set +e # for some reason the mkvirtualenv command fails even on success
  mkvirtualenv -p python3 3
  echo "working on virtualenv"
  workon 3
  echo "installing requirements"
  pip install -r ~/zeus/setup/requirements.txt
  deactivate
  set -e
fi
if [ ! -d "$WORKON_HOME/2" ]; then
  set +e
  mkvirtualenv -p python2 2
  workon 2
  pip install -r ~/zeus/setup/requirements.txt
  deactivate
  set -e
fi


