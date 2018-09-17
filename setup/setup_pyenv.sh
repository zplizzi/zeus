set -e

rm -rf ~/.pyenv

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Get it running
# These are also in .zshrc so it runs with each zsh session
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Python installation dependencies
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev

# Install desired python versions, skipping if already installed
# Use this flag so that YouCompleteMe works
export PYTHON_CONFIGURE_OPTS="--enable-shared"
pyenv install -s 3.6.4

# Set the python version to use globally
pyenv global 3.6.4

pip install -r ~/zeus/setup/requirements.txt
