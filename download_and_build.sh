
# https://llvm.org/docs/GettingStarted.html

gcc_version=11.2.0

wget https://ftp.gnu.org/gnu/gcc/gcc-${gcc_version}/gcc-${gcc_version}.tar.gz > /dev/null
tar xvf gcc-${gcc_version}.tar.gz > /dev/null

cd gcc-${gcc_version}
./contrib/download_prerequisites
cd ..
mkdir gcc-${gcc_version}-build
cd gcc-${gcc_version}-build

$PWD/../gcc-${gcc_version}/configure --prefix=$HOME/toolchains --enable-languages=c,c++
make -j$(nproc)
make install