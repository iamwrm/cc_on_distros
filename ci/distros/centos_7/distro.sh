set -xe

yum -y install \
    epel-release \
    dnf \
    ca-certificates

dnf install -y wget git curl \
    python3 python3-pip openssl-devel \
    unzip \
    make \
    which \
    openssl-devel \
    openssl-libs \
    ninja-build

yum groupinstall -y "Development tools"

echo "--------- Setting up cmake to cmake3"
dnf install -y cmake3
ln -sf /usr/bin/cmake3 /usr/bin/cmake

echo "--------- Setting up gcc-11 toolchain"
yum install -y centos-release-scl
yum install -y devtoolset-11*
source /opt/rh/devtoolset-11/enable
echo "source /opt/rh/devtoolset-11/enable \n" > /tmp/setup_cc.sh

echo "--------- Compiling mold "
git clone https://github.com/rui314/mold.git
pushd mold 
git checkout v1.4.2
make -j$(nproc) CXX=g++
mkdir -p /usr/local/bin && mkdir -p /usr/local/lib/mold
mv mold /usr/local/bin
mv mold-wrapper.so /usr/local/lib/mold
ls /usr/local/lib/mold
mold --version
popd


