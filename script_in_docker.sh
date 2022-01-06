ls
pwd
uname -a
gcc_tar=$(ls gcc*tar.gz)
echo ${gcc_tar}
gcc_dir=${gcc_tar::-7}
echo ${gcc_dir}
ls

bash prepare_centos_build_system.sh

cd ${gcc_dir}
./contrib/download_prerequisites
cd ..
mkdir ${gcc_dir}-build
cd ${gcc_dir}-build
$PWD/../${gcc_dir}/configure --prefix=$HOME/toolchains --enable-languages=c,c++ --disable-multilib