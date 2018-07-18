set -e

sudo apt-get install -y linux-headers-`uname -r`

wget http://us.download.nvidia.com/tesla/384.145/NVIDIA-Linux-x86_64-384.145.run -O driver.run
sudo bash driver.run
