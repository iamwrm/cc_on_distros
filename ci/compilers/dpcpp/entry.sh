set -x
set -e


LINUX_BASEKIT_URL=https://registrationcenter-download.intel.com/akdlm/irc_nas/18445/l_BaseKit_p_2022.1.1.119_offline.sh
LINUX_HPCKIT_URL=https://registrationcenter-download.intel.com/akdlm/irc_nas/18438/l_HPCKit_p_2022.1.1.97_offline.sh
LINUX_CPP_COMPONENTS=intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic
LINUX_FORTRAN_COMPONENTS=intel-oneapi-compiler-fortran
LINUX_DPCPP_COMPONENTS=intel-oneapi-compiler-dpcpp-cpp
LINUX_CPP_COMPONENTS_WEB=intel.oneapi.lin.dpcpp-cpp-compiler-pro
LINUX_FORTRAN_COMPONENTS_WEB=intel.oneapi.lin.ifort-compiler
LINUX_DPCPP_COMPONENTS_WEB=intel.oneapi.lin.dpcpp-cpp-compiler
SAMPLES_TAG=2022.1.0


# ======================= install_linux.sh =======================

URL=$LINUX_BASEKIT_URL
COMPONENTS=$LINUX_DPCPP_COMPONENTS_WEB

curl --output webimage.sh --url "$URL" --retry 5 --retry-delay 5
chmod +x webimage.sh
./webimage.sh -x -f webimage_extracted --log extract.log
rm -rf webimage.sh
WEBIMAGE_NAME=$(ls -1 webimage_extracted/)
if [ -z "$COMPONENTS" ]; then
  sudo webimage_extracted/"$WEBIMAGE_NAME"/bootstrapper -s --action install --eula=accept --log-dir=.
  installer_exit_code=$?
else
  sudo webimage_extracted/"$WEBIMAGE_NAME"/bootstrapper -s --action install --components="$COMPONENTS" --eula=accept --log-dir=.
  installer_exit_code=$?
fi
rm -rf webimage_extracted
exit $installer_exit_code

# ======================= build_linux.sh =======================

LANGUAGE=dpc++
SAMPLES_TAG=$SAMPLES_TAG

git clone --depth 1 --branch "$SAMPLES_TAG" https://github.com/oneapi-src/oneAPI-samples.git

#shellcheck disable=SC2010
LATEST_VERSION=$(ls -1 /opt/intel/oneapi/compiler/ | grep -v latest | sort | tail -1)
# shellcheck source=/dev/null
source /opt/intel/oneapi/compiler/"$LATEST_VERSION"/env/vars.sh

case $LANGUAGE in
c++)
  cd oneAPI-samples/DirectProgramming/C++/CompilerInfrastructure/Intrinsics
  make && make run && make clean && make CC='icx -msse3' && make run
  ;;
fortran)
  cd oneAPI-samples/DirectProgramming/Fortran/CombinationalLogic/openmp-primes
  make && make run && make clean && make FC=ifx && make run
  ;;
dpc++)
#shellcheck disable=SC2010
  LATEST_VERSION=$(ls -1 /opt/intel/oneapi/tbb/ | grep -v latest | sort | tail -1)
# shellcheck source=/dev/null
  source /opt/intel/oneapi/tbb/"$LATEST_VERSION"/env/vars.sh
  cd oneAPI-samples/DirectProgramming/DPC++/DenseLinearAlgebra/vector-add
  make all && make run
  ;;
esac
