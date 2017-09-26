# Docker CE
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install docker-ce

# Allow use by non-root
sudo groupadd docker
sudo usermod -aG docker $USER


# Docker compose
pip install docker-compose



echo "Success. You will need to log-out and log back in to use docker without sudo"
