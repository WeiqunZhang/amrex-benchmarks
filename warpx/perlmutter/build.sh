#!/usr/bin/env bash

run_dir=$PWD
src_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
test_dir=${HOME}/mygitrepo/WarpX

cd ${test_dir}
make clean
make -j16 USE_MPI=TRUE USE_OMP=FALSE USE_CUDA=TRUE QED=FALSE
/bin/mv Bin/main3d.gnu.TPROF.MTMPI.CUDA.ex ${run_dir}
make clean

cd ${src_dir}
/bin/cp inputs run.sh ${run_dir}
