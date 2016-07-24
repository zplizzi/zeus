# Sets up an Ubuntu system how I like it

# Install packages
sudo apt-get install \

# Install global pip packages
pip install \
  virtualenvwrapper

# Set up virtual environment
export WORKON_HOME=~/venv
mkdir -p $WORKON_HOME
# Only create if it doesn't exist
if [ ! -d $WORKON_HOME/3.4 ]; then
  mkvirtualenv -p python3.4 3.4
fi
if [ ! -d $WORKON_HOME/2.7 ]; then
  mkvirtualenv -p python2.7 2.7
fi
