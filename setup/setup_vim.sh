
# Set to quit on errors
set -e


# install vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo "installing vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


# Install vundle plugins
echo "Installing vim plugins. Will throw an error, don't be alarmed, just hit ENTER."
vim +PluginInstall +qall


