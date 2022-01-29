set -xe

yum -y install \
    epel-release \
    dnf \
    ca-certificates

dnf install -y wget git curl \
    python3 python3-pip openssl-devel \
    unzip \
    cmake3 \
    which \
    ninja-build

yum groupinstall -y "Development tools"

ln -sf /usr/bin/cmake3 /usr/bin/cmake

## get gcc-10

yum install centos-release-scl
yum install devtoolset-10-gcc
scl enable devtoolset-10 bash
which gcc
gcc --version
