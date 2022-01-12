set -xe

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get install -y build-essential \
    git \
    wget \
    curl \
    cmake \
    python3 python3-pip
