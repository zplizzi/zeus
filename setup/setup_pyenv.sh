set -e

rm -rf ~/.pyenv

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Get it running
# These are also in .zshrc so it runs with each zsh session
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
pyenv init -

# Python installation dependencies
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev

# Install desired python versions, skipping if already installed
pyenv install -s 3.6.6

# Set the python version to use globally
pyenv global 3.6.6

which pip

# Unclear if this works properly
pip install -r ~/zeus/setup/requirements.txt
