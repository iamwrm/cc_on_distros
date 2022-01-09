LINUX_BASEKIT_URL=https://registrationcenter-download.intel.com/akdlm/irc_nas/18445/l_BaseKit_p_2022.1.1.119_offline.sh
LINUX_HPCKIT_URL=https://registrationcenter-download.intel.com/akdlm/irc_nas/18438/l_HPCKit_p_2022.1.1.97_offline.sh
LINUX_CPP_COMPONENTS=intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic
LINUX_FORTRAN_COMPONENTS=intel-oneapi-compiler-fortran
LINUX_DPCPP_COMPONENTS=intel-oneapi-compiler-dpcpp-cpp
LINUX_CPP_COMPONENTS_WEB=intel.oneapi.lin.dpcpp-cpp-compiler-pro
LINUX_FORTRAN_COMPONENTS_WEB=intel.oneapi.lin.ifort-compiler
LINUX_DPCPP_COMPONENTS_WEB=intel.oneapi.lin.dpcpp-cpp-compiler
SAMPLES_TAG=2022.1.0


bash ci/dpcpp/install_linux.sh $LINUX_BASEKIT_URL $LINUX_DPCPP_COMPONENTS_WEB

bash ci/dpcpp/build_linux.sh dpc++ $SAMPLES_TAG


