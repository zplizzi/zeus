
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

# Install GPG plugin by copying file to plugin dir. 
# Need to update this file manually for new versions.
mkdir -p ~/.vim/plugin
cp ~/zeus/setup/gpg/gnupg.vim ~/.vim/plugin/gnupg.vim
# After this, it should "just work", for symmetric-key encrypted files at least.
