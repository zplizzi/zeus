# Do setup here that is OS-independent

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

# Set up my directory structure
mkdir -p ~/projects


# Use zsh as your shell
# Put the path in /etc/shells otherwise it'll complain about "nonstandard path"
if ! grep -q zsh /etc/shells; then
  echo "adding zsh path to /etc/shells"
  sudo echo $(which zsh) >> /etc/shells
fi

echo "setting ZSH as shell"
sudo chsh -s $(which zsh) $USER

# install vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo "installing vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install vundle plugins
vim +PluginInstall +qall

# do this last because it'll quit the script and start zsh
echo "installing oh my zsh." 
export SHELL=zsh
set +e
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

read -p "Would you like to put dotfile links to ~/zeus in your home directory (y/n)? " yn
case $yn in
  [Yy]* ) cp -r ~/zeus/init/. ~;;
  [Nn]* ) ;;
  * ) echo "Please answer y or n.";;
esac

echo "Setup finished. Run 'zsh' to enter the zsh prompt"
