set -xe

yum install -y wget git curl ca-certificates cmake python3 python3-pip
yum groupinstall -y "Development tools"

