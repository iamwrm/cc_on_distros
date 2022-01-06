gcc_version=$1
wget -c -q https://ftp.gnu.org/gnu/gcc/gcc-${gcc_version}/gcc-${gcc_version}.tar.gz
tar xvf gcc-${gcc_version}.tar.gz > /dev/null