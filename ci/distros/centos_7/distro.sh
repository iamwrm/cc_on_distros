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
    openssl-devel \
    ninja-build

yum groupinstall -y "Development tools"

ln -sf /usr/bin/cmake3 /usr/bin/cmake

## get gcc-10

yum install -y centos-release-scl
yum install -y devtoolset-10*
scl enable devtoolset-10 'which gcc'
scl enable devtoolset-10 'gcc --version'
scl enable devtoolset-10 'which g++'
scl enable devtoolset-10 'g++ --version'

# echo "source /opt/rh/devtoolset-10/enable \n" > /tmp/setup_cc.sh

echo "source /opt/rh/devtoolset-10/enable \n" >> /etc/profile
