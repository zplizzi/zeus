# Sets up an Ubuntu system how I like it

# Set to quit on errors
set -e

# Get rid of extraneous directories
rm -rf Documents/ Music/ Pictures/ Public/ Templates/ Videos/

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
  build-essential \
  python-dev \
  python3-dev \
  libpng-dev \
  libfreetype6-dev \
  libxft-dev \
  htop \
  iftop \
  screen \
  vim-gtk \
  silversearcher-ag
  
## Remap CAPS key to CTRL
# Should take effect immediately
# TODO: debug this line
if sudo grep -q ctrl:nocaps "/etc/default/keyboard"; then
	echo "Appears that CAPS key is already mapped, skipping."
else
	if hash setxkbmap 2>/dev/null; then
		echo "XKBOPTIONS=\"ctrl:nocaps\"" | sudo tee -a /etc/default/keyboard
		setxkbmap -option ctrl:nocaps
		echo "Mapped CAPS to CTRL"
	else
		echo "setxkbmap not found: cannot set CAPS to CTRL"
	fi
fi


# Run general setup files 
bash ~/zeus/setup/setup_vim.sh
bash ~/zeus/setup/setup_zsh.sh
bash ~/zeus/setup/setup_venv.sh

bash ~/zeus/setup/setup.sh
