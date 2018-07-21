set -e

sudo apt-get install -y autoconf automake autotools-dev g++ pkg-config python-dev python3-dev libtool make

mkdir -p ~/software

cd ~/software

if [[ ! -d pyflame ]]; then
#rm -rf pyflame
  git clone https://github.com/uber/pyflame.git
  cd pyflame
  # Not sure if this works with more than one python version
  PKG_CONFIG_PATH="$(find ~/.pyenv/ -iname pkgconfig)/"
  echo $PKG_CONFIG_PATH
  ./autogen.sh
  ./configure
  make
  cd ..
fi

if [[ ! -d FlameGraph ]]; then
  git clone https://github.com/brendangregg/FlameGraph.git
fi

echo 'alias flame="~/software/FlameGraph/flamegraph.pl ~/temp/flame.txt > ~/temp/flame.svg"' >> ~/.zshrc

echo 'alias flamee="flame && cd ~/temp && python -m http.server"' >> ~/.zshrc
echo 'alias pyflame="sudo ~/software/pyflame/src/pyflame"' >> ~/.zshrc
