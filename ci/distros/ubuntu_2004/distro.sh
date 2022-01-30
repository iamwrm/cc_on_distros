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

echo "Setup mold for faster building"
curl -fsSL https://raw.githubusercontent.com/ren15/mold_ci/HEAD/install.sh | bash

touch /tmp/setup_cc.sh