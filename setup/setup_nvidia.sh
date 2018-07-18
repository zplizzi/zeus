set -e

# Using an apt package would probably work also and maybe be easier
# Might be unhappy without x windows though

sudo apt-get install -y linux-headers-`uname -r`

wget http://us.download.nvidia.com/tesla/384.145/NVIDIA-Linux-x86_64-384.145.run -O driver.run

# Make sure you actually have a GPU on this computer first!
sudo bash driver.run
