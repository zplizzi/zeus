# Sets up an OSX system how I like it

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
brew install \
  mosh \
  git \
  wget \
  python3
  
  
# Run general setup file
bash ~/zeus/setup/setup.sh
