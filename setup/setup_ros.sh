# Install PPA
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Add keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116

# Update packages
sudo apt-get update

# Install everything kinetic
# WILL ONLY WORK ON 16.04 (and a few others)
echo "Installing ROS kinetic. Will likely fail if you're not on 16.04 or similar"
sudo apt-get install ros-kinetic-desktop-full python-rosinstall

# Update rosdep
sudo rosdep init
rosdep update

# Add ros init to bashrc
echo "Adding ROS init to .zshrc. If you're using bash, do this manually."
echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc
source ~/.zshrc
