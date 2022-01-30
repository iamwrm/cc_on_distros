set -xe

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get install -y build-essential \
    wget \
    curl \
    cmake \
    python3 python3-pip \
    ninja-build \
    unzip \
    git

touch /tmp/setup_cc.sh