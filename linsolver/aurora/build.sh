#!/usr/bin/env bash

run_dir=$PWD
src_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
test_dir=${src_dir}/..

cd ${test_dir}
make clean
make -j16 USE_MPI=TRUE USE_OMP=FALSE USE_SYCL=TRUE SYCL_AOT=TRUE
/bin/mv main3d.sycl.MPI.ex ${run_dir}
make clean

cd ${src_dir}
/bin/cp inputs run.sh ${run_dir}
