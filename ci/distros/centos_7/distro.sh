set -xe

yum -y install \
    epel-release \
    dnf \
    ca-certificates

dnf install -y wget git curl \
    python3 python3-pip openssl-devel \
    unzip \
    cmake3 \
    make \
    which \
    openssl-devel \
    openssl-libs \
    ninja-build

yum groupinstall -y "Development tools"

ln -sf /usr/bin/cmake3 /usr/bin/cmake

yum install -y centos-release-scl
yum install -y devtoolset-10*

source /opt/rh/devtoolset-10/enable

echo "source /opt/rh/devtoolset-10/enable \n" > /tmp/setup_cc.sh

echo "Compiling mold"                                                                                                                       
git clone https://github.com/rui314/mold.git
cd mold 
git checkout v1.0.2
make -j$(nproc) CXX=g++
mkdir -p /usr/local/bin && mkdir -p /usr/local/lib/mold
mv mold /usr/local/bin
mv mold-wrapper.so /usr/local/lib/mold
ls /usr/local/lib/mold

mold --version
