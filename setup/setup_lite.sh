# This is intended to setup only minimal things on systems with arbitrary OS's
echo "You need git and zsh installed prior to running this script!"

git config --global push.default matching
bash ~/zeus/setup/setup_vim.sh
bash ~/zeus/setup/setup.sh
bash ~/zeus/setup/setup_zsh.sh
git config --global push.default matching

