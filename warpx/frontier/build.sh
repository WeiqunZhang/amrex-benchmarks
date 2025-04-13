#!/usr/bin/env bash

run_dir=$PWD
src_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
test_dir=${HOME}/mygitrepo/WarpX

module load craype-accel-amd-gfx90a
module load rocm

cd ${test_dir}
make USE_HIP=TRUE clean
make -j16 USE_MPI=TRUE USE_OMP=FALSE QED=FALSE USE_HIP=TRUE
/bin/mv main3d.*.MTMPI.HIP.ex ${run_dir}
make USE_HIP=TRUE clean

cd ${src_dir}
/bin/cp inputs run.sh ${run_dir}
