loadedgnu=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
loadedintel=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-intel`
loadedcray=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-cray`
loadeddarshan=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep darshan`
if [ "x${loadedintel}" = x ]; then
    if [ "x${loadedcray}" != x ]; then
      module swap PrgEnv-cray PrgEnv-intel
    fi
    if [ "x${loadedgnu}" != x ]; then
      module swap PrgEnv-gnu PrgEnv-intel
    fi
fi
module swap craype-haswell craype-mic-knl
module swap intel intel/17.0.2.174
module load gcc/6.3.0
module load cmake
module load git
export CRAYPE_LINK_TYPE=dynamic

