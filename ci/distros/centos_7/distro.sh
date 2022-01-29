set -xe

yum -y install \
    epel-release \
    dnf \
    ca-certificates

dnf install -y wget git curl \
    python3 python3-pip openssl-devel \
    unzip \
    cmake3 \
    ninja-build

yum groupinstall -y "Development tools"

ln -sf /usr/bin/cmake3 /usr/bin/cmake
