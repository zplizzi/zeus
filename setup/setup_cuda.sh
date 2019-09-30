# Update: don't use this!
# Turns out pytorch ships with cuda and cudnn included. So only the drivers are necessary.
# Probably easiest to install them from PPA.
# Use this guide:
# https://askubuntu.com/questions/1077061/how-do-i-install-nvidia-and-cuda-drivers-into-ubuntu/1077063#1077063

set -e

sudo apt-get update && 
sudo apt-get install -y --no-install-recommends ca-certificates apt-transport-https gnupg-curl
NVIDIA_GPGKEY_SUM=d1be581509378368edeec8c1eb2958702feedf3bc3d17011adbf24efacce4ab5
NVIDIA_GPGKEY_FPR=ae09fe4bbd223a84b2ccfce3f60f4b3d7fa2af80
#apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
#apt-key adv --export --no-emit-version -a $NVIDIA_GPGKEY_FPR | tail -n +5 > cudasign.pub
#echo "$NVIDIA_GPGKEY_SUM  cudasign.pub" | sha256sum -c --strict -
#rm cudasign.pub
echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" | sudo tee /etc/apt/sources.list.d/nvidia-ml.list

CUDA_VERSION=9.0.176

CUDA_PKG_VERSION="9-0=$CUDA_VERSION-1"
sudo apt-get install -y --force-yes --no-install-recommends \
        cuda-cudart-$CUDA_PKG_VERSION

sudo ln -f -s cuda-9.0 /usr/local/cuda

# nvidia-docker 1.0
#LABEL com.nvidia.volumes.needed="nvidia_driver"
#LABEL com.nvidia.cuda.version="${CUDA_VERSION}"

echo "/usr/local/nvidia/lib" | sudo tee -a /etc/ld.so.conf.d/nvidia.conf
echo "/usr/local/nvidia/lib64" | sudo tee -a /etc/ld.so.conf.d/nvidia.conf

echo "PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}" >> ~/.zshrc
echo "LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64" >> ~/.zshrc
echo "LIBRARY_PATH=/usr/local/cuda/lib64/stubs" >> ~/.zshrc

# nvidia-container-runtime
#ENV NVIDIA_VISIBLE_DEVICES all
#ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
#ENV NVIDIA_REQUIRE_CUDA "cuda>=9.0"

CUDNN_VERSION=7.1.4.18
NCCL_VERSION=2.2.12

sudo apt-get install -y --force-yes --no-install-recommends \
        cuda-libraries-$CUDA_PKG_VERSION \
        cuda-cublas-9-0=9.0.176.3-1 \
        libnccl2=$NCCL_VERSION-1+cuda9.0 \
        cuda-libraries-dev-$CUDA_PKG_VERSION \
        cuda-nvml-dev-$CUDA_PKG_VERSION \
        cuda-minimal-build-$CUDA_PKG_VERSION \
        cuda-command-line-tools-$CUDA_PKG_VERSION \
        cuda-core-9-0=9.0.176.3-1 \
        cuda-cublas-dev-9-0=9.0.176.3-1 \
        libnccl-dev=$NCCL_VERSION-1+cuda9.0 \
        libcudnn7=$CUDNN_VERSION-1+cuda9.0 \
        libcudnn7-dev=$CUDNN_VERSION-1+cuda9.0


# Install the NVIDIA graphics driver
# Might need this (and an apt update)
#sudo add-apt-repository ppa:graphics-drivers
#sudo apt install -y --no-install-recommends nvidia-387

# See this path for an alterative to the non-nvidia ppa above
# https://devtalk.nvidia.com/default/topic/1000340/cuda-setup-and-installation/-quot-nvidia-smi-has-failed-because-it-couldn-t-communicate-with-the-nvidia-driver-quot-ubuntu-16-04/4
