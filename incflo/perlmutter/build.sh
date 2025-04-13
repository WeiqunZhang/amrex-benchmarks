#!/usr/bin/env bash

run_dir=$PWD
src_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
test_dir=${HOME}/mygitrepo/incflo/test_no_eb_3d

cd ${test_dir}
make clean
make -j16 USE_MPI=TRUE USE_OMP=FALSE USE_CUDA=TRUE
/bin/mv incflo3d.gnu.MPI.CUDA.ex ${run_dir}
make clean

cd ${src_dir}
/bin/cp inputs run.sh ${run_dir}
