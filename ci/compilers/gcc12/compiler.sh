set -xe


gcc_version=12.2.0
wget --no-verbose https://ftp.gnu.org/gnu/gcc/gcc-${gcc_version}/gcc-${gcc_version}.tar.gz
tar xvf gcc-${gcc_version}.tar.gz

WORK_DIR=${PWD}
INSTALL_PREFIX=${WORK_DIR}/toolchains

gcc_tar=$(ls gcc*tar.gz)
gcc_dir=${gcc_tar::-7}
echo ${gcc_tar}
echo ${gcc_dir}

GCC_SRC_DIR=${WORK_DIR}/${gcc_dir}
GCC_BUILD_DIR=${WORK_DIR}/${gcc_dir}-build


cd ${GCC_SRC_DIR}
./contrib/download_prerequisites

mkdir -p ${GCC_BUILD_DIR}
mkdir -p ${INSTALL_PREFIX}

cd ${GCC_BUILD_DIR}
${GCC_SRC_DIR}/configure --prefix=${INSTALL_PREFIX} --enable-languages=c,c++ --disable-multilib


make -j$(nproc) 1>/dev/null
make install

rm -rf ${GCC_BUILD_DIR}

