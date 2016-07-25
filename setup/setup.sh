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


echo "copying init dotfiles into your home directory"
cp ~/zeus/init/* ~/


# Use zsh as your shell
# Put the path in /etc/shells otherwise it'll complain about "nonstandard path"
if ! grep -q zsh /etc/shells; then
	sudo echo $(which zsh) >> /etc/shells
fi

echo "setting ZSH as shell"
chsh -s $(which zsh)



