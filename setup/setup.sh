# Do setup here that is OS-independent

# Set to quit on errors
set -e

# Set up my directory structure
mkdir -p ~/projects

read -p "Would you like to put dotfile links to ~/zeus in your home directory (y/n)? " yn
echo "you said :" $yn
case $yn in
  [Yy]* ) cp -r ~/zeus/init/. ~;;
  [Nn]* ) ;;
  * ) echo "Please answer y or n.";;
esac

echo "Setup finished. Run 'zsh' to enter the zsh prompt"
