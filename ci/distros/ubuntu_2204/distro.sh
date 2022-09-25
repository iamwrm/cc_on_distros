set -xe

export MOLD_VERSION="v1.4.2"


export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get install -y build-essential \
    wget \
    curl \
    cmake \
    python3 python3-pip \
    ninja-build \
    unzip \
    git \
    libssl-dev

echo "--------- Compiling mold "
git clone https://github.com/rui314/mold.git
pushd mold 
git checkout $MOLD_VERSION
make -j$(nproc) CXX=g++
mkdir -p /usr/local/bin && mkdir -p /usr/local/lib/mold
mv mold /usr/local/bin
mv mold-wrapper.so /usr/local/lib/mold
ls /usr/local/lib/mold
mold --version
popd

touch /tmp/setup_cc.sh