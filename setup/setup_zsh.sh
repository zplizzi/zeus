
# Set to quit on errors
set -e


# Use zsh as your shell
# Put the path in /etc/shells otherwise it'll complain about "nonstandard path"
if ! grep -q zsh /etc/shells; then
  echo "adding zsh path to /etc/shells"
  sudo echo $(which zsh) >> /etc/shells
fi

echo "setting ZSH as shell"
sudo chsh -s $(which zsh) $USER


if [ ! -d ~/.oh-my-zsh ]; then
	echo "installing oh my zsh";
	git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh;
else
	echo "oh my zsh is already installed";
fi


