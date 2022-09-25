set -xe

export MOLD_VERSION="v1.4.2"


pacman -Syu --noconfirm
pacman -S --noconfirm \
    git base-devel \
    wget \
    curl \
    cmake \
    python python-pip \
    ninja \
    unzip \
    openssl

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