set -xe

yum install -y wget git curl ca-certificates \
    python3 python3-pip openssl-devel \
    unzip \
    ninja-build
yum groupinstall -y "Development tools"

wget -c https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1.tar.gz
tar xvf cmake-3.22.1.tar.gz
cd cmake-3.22.1
./configure --prefix=/usr/local
make -j$(nproc)
make install