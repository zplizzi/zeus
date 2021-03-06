# Sets up an Ubuntu 18.04 LTS system how I like it

# Set to quit on errors
set -e


# Install packages
sudo apt-get update
sudo apt-get -y upgrade
# build-essential, python-dev, libpng-dev, libfreetype6-dev required for matplotlib
sudo apt-get -y install \
  zsh \
  mosh \
  git \
  python \
  python-pip \
  python3-pip \
  build-essential \
  python-dev \
  python3-dev \
  libpng-dev \
  libfreetype6-dev \
  libxft-dev \
  htop \
  iftop \
  screen \
  vim \
  silversearcher-ag
  

# Run general setup files 
bash ~/zeus/setup/setup.sh

bash ~/zeus/setup/setup_vim.sh
bash ~/zeus/setup/setup_zsh.sh
#bash ~/zeus/setup/setup_venv.sh
bash ~/zeus/setup/setup_pyenv.sh
bash ~/zeus/setup/setup_jupyter.sh

echo "Setup finished. Run 'zsh' to enter the zsh prompt"
